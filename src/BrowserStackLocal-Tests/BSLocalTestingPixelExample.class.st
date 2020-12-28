Class {
	#name : #BSLocalTestingPixelExample,
	#superclass : #BSLocalTestingAbstract,
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #tests }
BSLocalTestingPixelExample >> getCapabilities [
| option |
	option := BPGenericOptions new.
	option setCapability: 'os_version' to: '11.0'.
	option setCapability: 'device' to: 'Google Pixel 4'.
	option setCapability: 'real_mobile' to: true.
	option setCapability: 'browserstack.local' to: true.
	option setCapability: 'project' to: 'ce-challenge'.
	option setCapability: 'name' to: 'smalltalk-test'.
	option setCapability: 'build' to: BSBuildName value.
	^ option
]
