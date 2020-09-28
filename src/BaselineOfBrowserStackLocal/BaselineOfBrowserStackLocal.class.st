Class {
	#name : #BaselineOfBrowserStackLocal,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrowserStackLocal
}

{ #category : #baselines }
BaselineOfBrowserStackLocal >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec 
			baseline: 'Seaside3' with: [
				spec
					loads: #('Tests' 'Zinc-Seaside');
					repository: 'github://SeasideSt/Seaside/repository'].
			spec
				baseline: 'OSSubprocess'
				with: [ spec
						repository: 'github://pharo-contributions/OSSubprocess:master/repository';
						loads: #default ].
			spec
				package: 'BrowserStackLocal'
				with: [ spec requires: #(OSSubprocess) ].
			spec
				package: 'BrowserStackLocal-Tests'
				with: [ spec requires: #(BrowserStackLocal Seaside3) ] ]
]
