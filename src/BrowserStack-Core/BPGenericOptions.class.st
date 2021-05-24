Class {
	#name : #BPGenericOptions,
	#superclass : #BPMutableCapabilities,
	#instVars : [
		'arguments',
		'experimentalOptions'
	],
	#category : #'BrowserStack-Core'
}

{ #category : #comparing }
BPGenericOptions >> = other [

	^ (self class = other class)  and: [ (dict = other privateCapabilitiesDictionary) & (arguments = other privateArguments) & (experimentalOptions = other privateExperimentalOptions) ]
]

{ #category : #accessing }
BPGenericOptions >> addArguments: extraArguments [

	arguments addAll: extraArguments.

]

{ #category : #comparing }
BPGenericOptions >> hash [

	^ dict hash

]

{ #category : #'initialize-release' }
BPGenericOptions >> initialize [

	super initialize.
	self setCapability: 'browserName' to: 'chrome'.
	arguments := OrderedCollection new.
	experimentalOptions := Dictionary new.

]

{ #category : #private }
BPGenericOptions >> privateArguments [

	^ arguments
]

{ #category : #private }
BPGenericOptions >> privateCapabilitiesDictionary [

	^ dict
]

{ #category : #private }
BPGenericOptions >> privateExperimentalOptions [

	^ experimentalOptions
]

{ #category : #private }
BPGenericOptions >> privateSessionCreationJSON [
	^ Dictionary new
		at: 'capabilities'
			put:
			(Dictionary new
				at: 'firstMatch' put: (Array with: dict copy);
				yourself);
		yourself
]

{ #category : #accessing }
BPGenericOptions >> setExperimentalOption: optionName to: value [

	experimentalOptions at: optionName put: value.

]

{ #category : #accessing }
BPGenericOptions >> setHeadless: boolean [

	arguments remove: '--headless' ifAbsent: [ ].
	boolean ifTrue: [ arguments addAll: #('--headless' '--disable-gpu') ].

]
