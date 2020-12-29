Class {
	#name : #ParallelTestSuite,
	#superclass : #TestSuite,
	#classVars : [
		'TestPool'
	],
	#category : #BrowserStackParallel
}

{ #category : #'class initialization' }
ParallelTestSuite class >> initialize [
	TestPool := TKTWorkerPool new.
	TestPool name: 'test pool'.
	TestPool poolMaxSize: 10.
	TestPool start.
]

{ #category : #running }
ParallelTestSuite >> runUnmanaged: aResult [
	| future |
	self setUp.
	
	future := [  ] future.
	[ self tests
		do: [ :each | 
			future := future
				zip:
					(TestPool
						future: [ each run: aResult.
							self announceTest: each.
							self changed: each ]) ].
	future synchronizeTimeout: 2 minutes ]
		ensure: [ self tearDown ]
]
