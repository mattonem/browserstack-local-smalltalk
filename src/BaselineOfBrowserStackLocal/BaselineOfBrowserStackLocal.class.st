Class {
	#name : #BaselineOfBrowserStackLocal,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrowserStackLocal
}

{ #category : #baselines }
BaselineOfBrowserStackLocal >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self dependencies: spec.
		self definePackages: spec ].
	spec
		group: 'core' with: #( 'BrowserStack-Core' );
		group: 'local' with: #( core BrowserStackLocal );
		group: 'parallel' with: #( core ParallelTesting );
		group: 'default' with: #( parallel local );
		group: 'tests'
		with: #( 'BrowserStackLocal-Tests' 'BrowserStackParallel-Tests'
			    'BrowserStack-Core-Tests' )
]

{ #category : #baselines }
BaselineOfBrowserStackLocal >> definePackages: spec [

	spec
		package: 'BrowserStackLocal'
		with: [ spec requires: #( core OSSubprocess NeoJSON ) ].
	spec
		package: 'BrowserStackParallel-Tests'
		with: [ spec requires: #( local core ParallelTesting) ].
	spec
		package: 'BrowserStackLocal-Tests'
		with: [ spec requires: #( BrowserStackLocal) ].
	spec
		package: 'BrowserStack-Core'
		with: [ spec requires: #( Parasol ) ].
	spec
		package: 'BrowserStack-Core-Tests'
		with: [ spec requires: #( core ) ]
]

{ #category : #baselines }
BaselineOfBrowserStackLocal >> dependencies: spec [

	spec
		baseline: 'NeoJSON' with: [ 
			spec
				loads: #( 'core' );
				repository: 'github://svenvc/NeoJSON/repository' ];
		baseline: 'Parasol' with: [ 
			spec
				loads: #( 'core' );
				repository: 'github://SeasideSt/Parasol/repository' ];
		baseline: 'OSSubprocess' with: [ 
			spec
				repository:
					'github://pharo-contributions/OSSubprocess:master/repository';
				loads: #default ];
		baseline: 'ParallelTesting' with: [ 
			spec
				repository: 'github://mattonem/ParallelTesting:master';
				loads: #core ]
]
