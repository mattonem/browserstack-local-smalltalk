Extension { #name : #BSLocalTestingParametrized }

{ #category : #'*BrowserStackParallel' }
BSLocalTestingParametrized class >> suiteClass [
	^ self isAbstract ifTrue: [ TestSuite ] ifFalse: [ ParallelTestSuite ]
]

{ #category : #'*BrowserStackParallel' }
BSLocalTestingParametrized class >> testParameters [ 	
	^ ParametrizedTestMatrix new
		addCase: { #capabilities -> self chromeCapabilities. };
		addCase: { #capabilities -> self pixelCapabilities. };			
		yourself.
]
