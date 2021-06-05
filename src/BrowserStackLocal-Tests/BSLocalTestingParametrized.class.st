Class {
	#name : #BSLocalTestingParametrized,
	#superclass : #BrowserstackTestCase,
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #tests }
BSLocalTestingParametrized class >> chromeCapabilities [

	<desiredCapability>
	^ BPGenericOptions new
		  setCapability: 'os' to: 'windows';
		  setCapability: 'os_version' to: '10';
		  setCapability: 'browser' to: 'Chrome';
		  setCapability: 'browser_version' to: 'latest';
		  setCapability: 'browserstack.local' to: true;
		  yourself
]

{ #category : #tests }
BSLocalTestingParametrized class >> pixelCapabilities [

	<desiredCapability>
	^ BPGenericOptions new
		setCapability: 'os_version' to: '11.0';
		setCapability: 'device' to: 'Google Pixel 4';
		setCapability: 'real_mobile' to: true;
		setCapability: 'browserstack.local' to: true;
		yourself.
]

{ #category : #tests }
BSLocalTestingParametrized class >> resources [

	^ super resources , { 
		  BSLocalTestResource.
		  BSZincServerTestResource }
]

{ #category : #tests }
BSLocalTestingParametrized >> defaultTimeLimit [ 
	^ 2 minute
]

{ #category : #running }
BSLocalTestingParametrized >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Zinc HTTP Components'
]
