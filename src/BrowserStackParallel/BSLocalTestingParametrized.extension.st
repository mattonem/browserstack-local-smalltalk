Extension { #name : #BSLocalTestingParametrized }

{ #category : #'*BrowserStackParallel' }
BSLocalTestingParametrized class >> suiteClass [
	^ParallelTestSuite
]

{ #category : #'*BrowserStackParallel' }
BSLocalTestingParametrized class >> testParameters [ 	
	^ ParametrizedTestMatrix new
		addCase: { #capabilities -> self chromeCapabilities. };
		addCase: { #capabilities -> self pixelCapabilities. };			
		yourself.
]
