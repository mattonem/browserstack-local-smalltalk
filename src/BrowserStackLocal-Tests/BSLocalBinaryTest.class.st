"
A BSLocalBinaryTest is a test class for testing the behavior of BSLocalBinary
"
Class {
	#name : #BSLocalBinaryTest,
	#superclass : #TestCase,
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #tests }
BSLocalBinaryTest >> testBiranyUrl [
	self shouldnt: BSLocal binaryUrl asZnUrl raise: Exception
]

{ #category : #tests }
BSLocalBinaryTest >> testDownload [
	self shouldnt: BSLocal getBinary raise: Exception
]

{ #category : #tests }
BSLocalBinaryTest >> testStartStopConnextion [
	self timeLimit: 30 seconds.
	BSLocal start.
	BSLocal stop
]
