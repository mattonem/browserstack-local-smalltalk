Extension { #name : #BSLocalTestingParametrized }

{ #category : #'*BrowserStackParallel' }
BSLocalTestingParametrized class >> suiteClass [
	^ self isAbstract ifTrue: [ TestSuite ] ifFalse: [ ParallelTestSuite ]
]
