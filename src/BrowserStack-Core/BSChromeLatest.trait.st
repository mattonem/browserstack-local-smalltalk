Trait {
	#name : #BSChromeLatest,
	#traits : 'BSCapacityTraits',
	#classTraits : 'BSCapacityTraits classTrait',
	#category : #'BrowserStack-Core-Capabilities'
}

{ #category : #tests }
BSChromeLatest classSide >> chromeLatestCapabilities [

	<desiredCapability>
	^ BPGenericOptions new
		  setCapability: 'os' to: 'windows';
		  setCapability: 'os_version' to: '10';
		  setCapability: 'browser' to: 'Chrome';
		  setCapability: 'browser_version' to: 'latest';
		  yourself
]
