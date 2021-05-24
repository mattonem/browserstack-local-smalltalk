Class {
	#name : #BSLocal,
	#superclass : #Object,
	#classInstVars : [
		'browserstackKey',
		'browserstackUsername',
		'pid'
	],
	#category : #BrowserStackLocal
}

{ #category : #accessing }
BSLocal class >> binaryUrl [
	^ Smalltalk os isWindows
		ifTrue:
			[ 'https://s3.amazonaws.com/browserStack/browserstack-local/BrowserStackLocal.exe' ]
		ifFalse: [ Smalltalk os isMacOS
				ifTrue:
					[ 'https://s3.amazonaws.com/browserStack/browserstack-local/BrowserStackLocal-darwin-x64' ]
				ifFalse: [ Smalltalk vm is64bit
						ifTrue:
							[ 'https://s3.amazonaws.com/browserStack/browserstack-local/BrowserStackLocal-linux-x64' ]
						ifFalse:
							[ 'https://s3.amazonaws.com/browserStack/browserstack-local/BrowserStackLocal-linux-x32' ] ] ]
]

{ #category : #accessing }
BSLocal class >> credentials [ 
	^ BrowserstackCredentials
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
BSLocal class >> running [
	^ pid isNotNil
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

	| response |
	pid ifNil: [ 
		OSSUnixSubprocess new
			command: self getBinary fullName;
			arguments: { 
					'-d'.
					'start'.
					self credentials browserstackKey };
			redirectStdout;
			runAndWaitOnExitDo: [ :cmd :output | 
				response := NeoJSONReader fromString: output.
				response at: 'state' ifPresent: [ :state | 
						state = 'connected' ifTrue: [ 
								pid := response at: 'pid'.
								^ self ] ].
				Error signal: output ] ]
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
		runAndWait.
	pid := nil.
]
