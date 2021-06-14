Trait {
	#name : #BSIE11,
	#traits : 'BSCapacityTraits',
	#classTraits : 'BSCapacityTraits classTrait',
	#category : #'BrowserStack-Core-Capabilities'
}

{ #category : #tests }
BSIE11 classSide >> IE11Capabilities [

	<desiredCapability>
	^ BPGenericOptions new
		  setCapability: 'os' to: 'windows';
		  setCapability: 'os_version' to: '10';
		  setCapability: 'browser' to: 'IE';
		  setCapability: 'browser_version' to: '11';
		  yourself
]
