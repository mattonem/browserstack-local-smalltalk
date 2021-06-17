Class {
	#name : #BSLocalTestingParallelized,
	#superclass : #BrowserstackTestCase,
	#traits : 'ParallelTestCase + BSChromeLatest + BSPixel4_11 + BSIE11 + BSIPhone12_14 + BSFirefoxLatest',
	#classTraits : 'ParallelTestCase classTrait + BSChromeLatest classTrait + BSPixel4_11 classTrait + BSIE11 classTrait + BSIPhone12_14 classTrait + BSFirefoxLatest classTrait',
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
	driver get: 'http://bs-local.com:8080'.
	self assert: driver getTitle equals: 'Zinc HTTP Components'
]
