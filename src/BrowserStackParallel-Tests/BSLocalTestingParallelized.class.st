Class {
	#name : #BSLocalTestingParallelized,
	#superclass : #BrowserstackTestCase,
	#traits : 'ParallelTestCase + BSChromeLatest + BSPixel',
	#classTraits : 'ParallelTestCase classTrait + BSChromeLatest classTrait + BSPixel classTrait',
	#category : #'BrowserStackParallel-Tests'
}

{ #category : #tests }
BSLocalTestingParallelized class >> resources [

	^ super resources , { 
		  BSLocalTestResource.
		  BSZincServerTestResource }
]

{ #category : #running }
BSLocalTestingParallelized >> defaultCapabilities: someCapabilities [

	super defaultCapabilities: someCapabilities.
	someCapabilities setCapability: 'browserstack.local' to: true
]

{ #category : #tests }
BSLocalTestingParallelized >> defaultTimeLimit [ 
	^ 3 minute
]

{ #category : #running }
BSLocalTestingParallelized >> testBSLocalParallized [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Zinc HTTP Components'
]
