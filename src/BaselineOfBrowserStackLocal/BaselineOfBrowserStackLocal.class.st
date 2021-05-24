Class {
	#name : #BaselineOfBrowserStackLocal,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrowserStackLocal
}

{ #category : #baseline }
BaselineOfBrowserStackLocal >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec baseline: 'NeoJSON' with: [ 
			spec
				loads: #( 'core' );
				repository: 'github://svenvc/NeoJSON/repository' ].
		spec baseline: 'Parasol' with: [ 
			spec
				loads: #( 'core' );
				repository: 'github://SeasideSt/Parasol/repository' ].
		spec baseline: 'Seaside3' with: [ 
			spec
				loads: #( 'Tests' 'Zinc' );
				repository: 'github://SeasideSt/Seaside/repository' ].
		spec baseline: 'OSSubprocess' with: [ 
			spec
				repository:
					'github://pharo-contributions/OSSubprocess:master/repository';
				loads: #default ].
		spec baseline: 'ParallelTesting' with: [ 
			spec
				repository: 'github://mattonem/ParallelTesting:master';
				loads: #core ].
		spec package: 'BrowserStackLocal' with: [ 
			spec requires:
				#( core OSSubprocess NeoJSON ) ].
		spec
			package: 'BrowserStackParallel-Tests'
			with: [ 
			spec requires: #( local core ParallelTesting ) ].
		spec
			package: 'BrowserStackLocal-Tests'
			with: [ spec requires: #( BrowserStackLocal ) ].

		spec package: 'BrowserStack-Core' with: [ spec requires: #( Parasol ) ] ].
	spec
		group: 'core' with: #( 'BrowserStack-Core' );
		group: 'local' with: #( core BrowserStackLocal );
		group: 'parallel' with: #( core ParallelTesting );
		group: 'default' with: #( parallel local );
		group: 'tests'
		with: #( 'BrowserStackLocal-Tests' 'BrowserStackParallel-Tests'
			   'Seaside3' )
]
