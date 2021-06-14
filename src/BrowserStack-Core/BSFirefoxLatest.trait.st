Trait {
	#name : #BSFirefoxLatest,
	#traits : 'BSCapacityTraits',
	#classTraits : 'BSCapacityTraits classTrait',
	#category : #'BrowserStack-Core-Capabilities'
}

{ #category : #tests }
BSFirefoxLatest classSide >> firefoxLatestCapabilities [

	<desiredCapability>
	^ BPGenericOptions new
		  setCapability: 'os' to: 'windows';
		  setCapability: 'os_version' to: '10';
		  setCapability: 'browser' to: 'Firefox';
		  setCapability: 'browser_version' to: 'latest';
		  yourself
]
