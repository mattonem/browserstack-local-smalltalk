Trait {
	#name : #BSPixel,
	#instVars : [
		'arguments',
		'experimentalOptions'
	],
	#category : #'BrowserStack-Core'
}

{ #category : #tests }
BSPixel classSide >> pixelCapabilities [

	<desiredCapability>
	^ BPGenericOptions new
		setCapability: 'os_version' to: '11.0';
		setCapability: 'device' to: 'Google Pixel 4';
		setCapability: 'real_mobile' to: true;
		setCapability: 'browserstack.local' to: true;
		yourself.
]
