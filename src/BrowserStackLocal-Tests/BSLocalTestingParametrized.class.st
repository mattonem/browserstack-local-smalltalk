Class {
	#name : #BSLocalTestingParametrized,
	#superclass : #BrowserstackTestCase,
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #tests }
BSLocalTestingParametrized class >> desiredCapabilities [

	^ { 
		  (BPGenericOptions new
			   setCapability: 'browser' to: 'Chrome';
			   yourself).
		  (BPGenericOptions new
			   setCapability: 'browser' to: 'Firefox';
			   yourself) }
]

{ #category : #tests }
BSLocalTestingParametrized class >> resources [

	^ super resources , { 
		  BSLocalTestResource.
		  BSZincServerTestResource }
]

{ #category : #running }
BSLocalTestingParametrized >> defaultCapabilities: someCapabilities [

	super defaultCapabilities: someCapabilities.
	someCapabilities setCapability: 'browserstack.local' to: true
]

{ #category : #running }
BSLocalTestingParametrized >> defaultTimeLimit [ 
	^ 2 minute
]

{ #category : #tests }
BSLocalTestingParametrized >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Zinc HTTP Components'
]
