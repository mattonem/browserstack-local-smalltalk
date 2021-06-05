Trait {
	#name : #BSCapacityTraits,
	#category : #'BrowserStack-Core-Capabilities'
}

{ #category : #tests }
BSCapacityTraits classSide >> testParameters [

	| matrix |
	matrix := ParametrizedTestMatrix new.
	(Pragma allNamed: #desiredCapability in: self class) do: [ :pragma | 
		matrix addCase: { (#capabilities
			 ->
			 (self defaultCapabilities: (self perform: pragma methodSelector))) } ].
	^ matrix
]
