Class {
	#name : #BrowserstackCoreTestUsingTraits,
	#superclass : #BrowserstackTestCase,
	#traits : 'BSChromeLatest + BSIPhone12_14 + BSPixel4_11 + BSFirefoxLatest + BSIE11',
	#classTraits : 'BSChromeLatest classTrait + BSIPhone12_14 classTrait + BSPixel4_11 classTrait + BSFirefoxLatest classTrait + BSIE11 classTrait',
	#category : #'BrowserStack-Core-Tests'
}

{ #category : #tests }
BrowserstackCoreTestUsingTraits >> testGoogle [

	driver get: 'https://google.fr'.
	self assert: true
]
