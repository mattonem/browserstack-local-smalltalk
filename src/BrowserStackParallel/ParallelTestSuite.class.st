Class {
	#name : #ParallelTestSuite,
	#superclass : #TestSuite,
	#classVars : [
		'TestPool'
	],
	#category : #BrowserStackParallel
}

{ #category : #'class initialization' }
ParallelTestSuite class >> testPool [
	^ TestPool ifNil: [ 
		TestPool := TKTWorkerPool new.
		TestPool name: 'test pool'.
		TestPool poolMaxSize: 10.
		TestPool start.]
	
]

{ #category : #running }
ParallelTestSuite >> runUnmanaged: aResult [

	| futures |
	self setUp.
	[ 
	futures := self tests collect: [ :each | 
		           self testPool future: [ 
			           each run: aResult.
			           self announceTest: each.
			           self changed: each ] ].
	(TKTFuture all: futures) synchronizeTimeout: 2 minutes ] ensure: [ 
		self tearDown ]
]

{ #category : #running }
ParallelTestSuite >> setUp [

	super setUp.
	ZnZincServerAdaptor startOn: 8080.
	BSLocal start
]

{ #category : #running }
ParallelTestSuite >> tearDown [ 
	super tearDown.
	BSLocal stop
]

{ #category : #running }
ParallelTestSuite >> testPool [
	^ self class testPool
]
