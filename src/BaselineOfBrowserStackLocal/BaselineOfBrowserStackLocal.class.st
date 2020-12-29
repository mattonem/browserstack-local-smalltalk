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
		do: [ spec
				baseline: 'Parasol'
				with: [ spec
						loads: #('tests');
						repository: 'github://mattonem/Parasol:browserstackGrid/repository' ].
			
			spec
				baseline: 'OSSubprocess'
				with: [ spec
						repository: 'github://pharo-contributions/OSSubprocess:master/repository';
						loads: #default ].
			spec
				baseline: 'TaskIt'
				with: [ spec repository: 'github://pharo-contributions/taskit:v1.0' ].
			spec
				package: 'BrowserStackLocal'
				with: [ spec requires: #(OSSubprocess 'Parasol') ].
			spec
				package: 'BrowserStackParallel'
				with: [ spec requires: #(core TaskIt) ].
			spec
				package: 'BrowserStackLocal-Tests'
				with: [ spec requires: #(core 'Parasol') ] ].
	spec
		group: 'core' with: #(BrowserStackLocal);
		group: 'tests' with: #('BrowserStackLocal-Tests');
		group: 'default' with: #(tests);
		group: 'parallel' with: #(BrowserStackParallel)
]
