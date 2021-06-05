Class {
	#name : #BrowserstackCoreTestCaseExample,
	#superclass : #BrowserstackTestCase,
	#category : #'BrowserStack-Core-Tests'
}

{ #category : #tests }
BrowserstackCoreTestCaseExample class >> chromeCapabilities [

	<desiredCapability>
	^ BPGenericOptions new
		  setCapability: 'os' to: 'windows';
		  setCapability: 'os_version' to: '10';
		  setCapability: 'browser' to: 'Chrome';
		  setCapability: 'browser_version' to: 'latest';
		  yourself
]

{ #category : #tests }
BrowserstackCoreTestCaseExample class >> pixelCapabilities [

	<desiredCapability>
	^ BPGenericOptions new
		setCapability: 'os_version' to: '11.0';
		setCapability: 'device' to: 'Google Pixel 4';
		setCapability: 'real_mobile' to: true;
		yourself.
]

{ #category : #tests }
BrowserstackCoreTestCaseExample >> testGoogle [

	driver get: 'https://google.fr'.
	self assert: true
]
