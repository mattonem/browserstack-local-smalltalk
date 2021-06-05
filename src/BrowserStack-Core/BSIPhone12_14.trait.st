Trait {
	#name : #'BSIPhone12_14',
	#traits : 'BSCapacityTraits',
	#classTraits : 'BSCapacityTraits classTrait',
	#category : #'BrowserStack-Core-Capabilities'
}

{ #category : #tests }
BSIPhone12_14 classSide >> iPhone12_14Capabilities [

	<desiredCapability>
	^ BPGenericOptions new
		setCapability: 'os_version' to: '14';
		setCapability: 'device' to: 'iPhone 12';
		setCapability: 'real_mobile' to: true;
		yourself.
]
