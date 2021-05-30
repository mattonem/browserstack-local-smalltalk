Class {
	#name : #BrowserstackCredentials,
	#superclass : #Object,
	#classInstVars : [
		'browserstackKey',
		'browserstackUsername'
	],
	#category : #'BrowserStack-Core'
}

{ #category : #accessing }
BrowserstackCredentials class >> browserstackKey [
	^ browserstackKey
		ifNil: [ Smalltalk os environment
				at: 'BROWSERSTACK_ACCESS_KEY'
				ifAbsent: [ '' ] ]
]

{ #category : #accessing }
BrowserstackCredentials class >> browserstackKey: aKey [
	^ browserstackKey := aKey
]

{ #category : #accessing }
BrowserstackCredentials class >> browserstackKeySettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #browserstackKey) 
		order: 1;
		label: 'Browserstack key' translated;
		description: 'Your browserstack private key';
		setSelector: #browserstackKey:;
		getSelector: #browserstackKey;
		target: self;
		parent: #browserstack.
]

{ #category : #accessing }
BrowserstackCredentials class >> browserstackUsername [
	^ browserstackUsername
		ifNil: [ Smalltalk os environment
				at: 'BROWSERSTACK_USERNAME'
				ifAbsent: [ '' ] ]
]

{ #category : #accessing }
BrowserstackCredentials class >> browserstackUsername: aUsername [
	^ browserstackUsername := aUsername
]

{ #category : #accessing }
BrowserstackCredentials class >> browserstackUsernameSettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #browserstackUsername) 
		order: 0;
		label: 'Browserstack username' translated;
		description: 'Your browserstack username';
		setSelector: #browserstackUsername:;
		getSelector: #browserstackUsername;
		target: self;
		parent: #browserstack.
]
