Class {
	#name : #BaselineOfBrowserStackLocal,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrowserStackLocal
}

{ #category : #baseline }
BaselineOfBrowserStackLocal >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec 
			baseline: 'Parasol' with: [
				spec
					loads: #('default');
					repository: 'github://mattonem/Parasol:browserstackGrid/repository'].
			spec
				baseline: 'OSSubprocess'
				with: [ spec
						repository: 'github://pharo-contributions/OSSubprocess:master/repository';
						loads: #default ].
			spec
				package: 'BrowserStackLocal'
				with: [ spec requires: #(OSSubprocess Parasol) ].
			spec
				package: 'BrowserStackLocal-Tests'
				with: [ spec requires: #(BrowserStackLocal) ] ]
]
