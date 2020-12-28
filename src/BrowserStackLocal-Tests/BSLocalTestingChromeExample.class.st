Class {
	#name : #BSLocalTestingChromeExample,
	#superclass : #BSLocalTestingAbstract,
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #tests }
BSLocalTestingChromeExample >> getCapabilities [
| option |
	option := BPChromeOptions new.
	option setCapability: 'browserstack.local' to: true.
	option setCapability: 'project' to: 'ce-challenge'.
	option setCapability: 'name' to: 'smalltalk-test'.
	option setCapability: 'build' to: BSBuildName value. 
	^ option
]
