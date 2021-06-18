Trait {
	#name : #'BSSamsungGalaxyS20Ultra_10',
	#traits : 'BSCapacityTraits',
	#classTraits : 'BSCapacityTraits classTrait',
	#category : #'BrowserStack-Core-Capabilities'
}

{ #category : #tests }
BSSamsungGalaxyS20Ultra_10 classSide >> samsungGalaxyS20Ultra_10Capabilities [

	<desiredCapability>
	^ BPGenericOptions new
		setCapability: 'os_version' to: '10.0';
		setCapability: 'device' to: 'Samsung Galaxy S20 Ultra';
		setCapability: 'real_mobile' to: true;
		yourself.
]
