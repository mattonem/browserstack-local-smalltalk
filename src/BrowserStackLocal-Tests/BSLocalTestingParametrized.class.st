Class {
	#name : #BSLocalTestingParametrized,
	#superclass : #BrowserstackTestCase,
	#category : #'BrowserStackLocal-Tests'
}

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

{ #category : #tests }
BSLocalTestingParametrized >> defaultTimeLimit [ 
	^ 2 minute
]

{ #category : #running }
BSLocalTestingParametrized >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Zinc HTTP Components'
]
