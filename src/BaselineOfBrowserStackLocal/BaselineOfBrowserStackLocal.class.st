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
		do: [ spec
				baseline: 'Parasol'
				with: [ spec
						loads: #('default');
						repository: 'github://SeasideSt/Parasol/repository' ].
			spec
				baseline: 'OSSubprocess'
				with: [ spec
						repository: 'github://pharo-contributions/OSSubprocess:master/repository';
						loads: #default ].
			spec
				baseline: 'ParallelTesting'
				with: [ spec repository: 'github://mattonem/ParallelTesting:master';
						loads: #core ].
			spec
				package: 'BrowserStackLocal'
				with: [ spec requires: #(OSSubprocess Parasol) ].
			spec
				package: 'BrowserStackParallel-Tests'
				with: [ spec requires: #(BrowserStackLocal Parasol ParallelTesting) ].
			spec
				package: 'BrowserStackLocal-Tests'
				with: [ spec requires: #(BrowserStackLocal Parasol) ] ].
	spec
		group: 'core' with: #(BrowserStackLocal);
		group: 'tests' with: #('BrowserStackLocal-Tests' 'BrowserStackParallel-Tests');
		group: 'default' with: #(tests);
		group: 'parallel' with: #(BrowserStackLocal ParallelTesting)
]
