Class {
	#name : #BSParallelTestSuite,
	#superclass : #TestSuite,
	#classVars : [
		'TestPool'
	],
	#category : #BrowserStackParallel
}

{ #category : #'class initialization' }
BSParallelTestSuite class >> testPool [
	^ TestPool ifNil: [ 
		TestPool := TKTWorkerPool new.
		TestPool name: 'test pool'.
		TestPool poolMaxSize: 10.
		TestPool start.]
	
]

{ #category : #running }
BSParallelTestSuite >> runUnmanaged: aResult [
	| future |
	self setUp.
	
	future := [  ] future.
	[ self tests
		do: [ :each | 
			future := future
				zip:
					(self testPool
						future: [ each run: aResult.
							self announceTest: each.
							self changed: each ]) ].
	future synchronizeTimeout: 2 minutes ]
		ensure: [ self tearDown ]
]

{ #category : #running }
BSParallelTestSuite >> testPool [
	^ self class testPool
]
