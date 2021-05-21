Class {
	#name : #BSSeasideServerTestResource,
	#superclass : #TestResource,
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #initialization }
BSSeasideServerTestResource >> setUp [ 	
		super setUp.
		ZnZincServerAdaptor default basicStart
]

{ #category : #initialization }
BSSeasideServerTestResource >> tearDown [  	
		super tearDown.
		ZnZincServerAdaptor default basicStop
]
