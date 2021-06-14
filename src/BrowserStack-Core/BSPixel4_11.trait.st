Trait {
	#name : #'BSPixel4_11',
	#traits : 'BSCapacityTraits',
	#classTraits : 'BSCapacityTraits classTrait',
	#category : #'BrowserStack-Core-Capabilities'
}

{ #category : #tests }
BSPixel4_11 classSide >> pixel4_11Capabilities [

	<desiredCapability>
	^ BPGenericOptions new
		setCapability: 'os_version' to: '11.0';
		setCapability: 'device' to: 'Google Pixel 4';
		setCapability: 'real_mobile' to: true;
		yourself.
]
