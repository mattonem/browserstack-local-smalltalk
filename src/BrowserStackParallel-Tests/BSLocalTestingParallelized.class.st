Class {
	#name : #BSLocalTestingParallelized,
	#superclass : #BrowserstackTestCase,
	#traits : 'ParallelTestCase',
	#classTraits : 'ParallelTestCase classTrait',
	#category : #'BrowserStackParallel-Tests'
}

{ #category : #tests }
BSLocalTestingParallelized class >> chromeCapabilities: capabilities [

	<desiredCapability>
	^ capabilities
		  setCapability: 'os' to: 'windows';
		  setCapability: 'os_version' to: '10';
		  setCapability: 'browser' to: 'Chrome';
		  setCapability: 'browser_version' to: 'latest';
		  setCapability: 'browserstack.local' to: true;
		  yourself
]

{ #category : #tests }
BSLocalTestingParallelized class >> pixelCapabilities: capabilities [

	<desiredCapability>
	^ capabilities
		setCapability: 'os_version' to: '11.0';
		setCapability: 'device' to: 'Google Pixel 4';
		setCapability: 'real_mobile' to: true;
		setCapability: 'browserstack.local' to: true;
		yourself.
]

{ #category : #tests }
BSLocalTestingParallelized class >> resources [

	^ super resources , { 
		  BSLocalTestResource.
		  BSSeasideServerTestResource }
]

{ #category : #tests }
BSLocalTestingParallelized >> defaultTimeLimit [ 
	^ 3 minute
]

{ #category : #running }
BSLocalTestingParallelized >> testBSLocalParallized [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.4'
]
