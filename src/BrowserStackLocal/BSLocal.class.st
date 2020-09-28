Class {
	#name : #BSLocal,
	#superclass : #Object,
	#classInstVars : [
		'browserstackKey',
		'browserstackUsername'
	],
	#category : #BrowserStackLocal
}

{ #category : #accessing }
BSLocal class >> binaryUrl [
	^ Smalltalk os isWindows
		ifTrue:
			[ 'https://s3.amazonaws.com/browserStack/browserstack-local/BrowserStackLocal.exe' ]
		ifFalse: [ Smalltalk vm is64bit
				ifTrue:
					[ 'https://s3.amazonaws.com/browserStack/browserstack-local/BrowserStackLocal-linux-x64' ]
				ifFalse:
					[ 'https://s3.amazonaws.com/browserStack/browserstack-local/BrowserStackLocal-linux-x32' ] ]
]

{ #category : #accessing }
BSLocal class >> browserstackKey [
	^ browserstackKey
		ifNil: [ Smalltalk os environment
				at: 'BROWSERSTACK_ACCESS_KEY'
				ifAbsent: [ '' ] ]
]

{ #category : #accessing }
BSLocal class >> browserstackKey: aKey [
	^ browserstackKey := aKey
]

{ #category : #accessing }
BSLocal class >> browserstackKeySettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #browserstackKey) 
		label: 'Browserstack key' translated;
		description: 'Your browserstack private key' translated;
		setSelector: #browserstackKey:;
		getSelector: #browserstackKey;
		target: self;
		parent: #browserstack.
]

{ #category : #accessing }
BSLocal class >> browserstackUsername [
	^ browserstackUsername
		ifNil: [ Smalltalk os environment
				at: 'BROWSERSTACK_ACCESS_USERNAME'
				ifAbsent: [ '' ] ]
]

{ #category : #accessing }
BSLocal class >> browserstackUsername: aUsername [
	^ browserstackUsername := aUsername
]

{ #category : #accessing }
BSLocal class >> browserstackUsernameSettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #browserstackUsername) 
		label: 'Browserstack username' translated;
		description: 'Your browserstack username' translated;
		setSelector: #browserstackUsername:;
		getSelector: #browserstackUsername;
		target: self;
		parent: #browserstack.
]

{ #category : #accessing }
BSLocal class >> downloadBinary [
	| file |
	ZnClient new
		url: self binaryUrl;
		downloadTo: FileLocator imageDirectory / 'browserstack'.
	file := (FileLocator imageDirectory / 'browserstack') files first.
	OSSUnixSubprocess new
		command: 'chmod';
		arguments:
			{'+x'.
			file fullName};
		runAndWait.
	OSSUnixSubprocess new
		command: file fullName;
		arguments: #('--version');
		runAndWaitOnExitDo: [ :process :output | 
			process isSuccess
				ifFalse: [ file delete.
					self error: 'Downlaoded binary was corupted' ] ]
]

{ #category : #accessing }
BSLocal class >> getBinary [
	(FileLocator imageDirectory / 'browserstack') ensureCreateDirectory.
	(FileLocator imageDirectory / 'browserstack') files isEmpty
		ifTrue:
			[ self downloadBinary ].
	^ (FileLocator imageDirectory / 'browserstack') files first
]

{ #category : #accessing }
BSLocal class >> settingsOn: aBuilder [
	<systemsettings>	
	(aBuilder group: #browserstack)
		target: self;
		label: 'BrowserStack' translated;
		description: 'Settings your browserstack account' translated.
]

{ #category : #accessing }
BSLocal class >> start [
	self stop.
	OSSUnixSubprocess new
		command: self getBinary fullName;
		arguments:
			{'-d'.
			'start'.
			self browserstackKey};
		runAndWait
]

{ #category : #accessing }
BSLocal class >> startForceLocal [
	self stop.
	OSSUnixSubprocess new
		command: self getBinary fullName;
		arguments:
			{'-d'.
			'start'.
			self browserstackKey.
			'-forcelocal'};
		runAndWait
]

{ #category : #accessing }
BSLocal class >> stop [
	OSSUnixSubprocess new
		command: self getBinary fullName;
		arguments: {'-d' . 'stop'};
		runAndWait
]