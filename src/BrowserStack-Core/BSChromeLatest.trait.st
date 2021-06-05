Trait {
	#name : #BSChromeLatest,
	#instVars : [
		'arguments',
		'experimentalOptions'
	],
	#category : #'BrowserStack-Core'
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
