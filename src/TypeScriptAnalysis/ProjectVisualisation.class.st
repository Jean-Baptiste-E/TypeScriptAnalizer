Class {
	#name : #ProjectVisualisation,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
ProjectVisualisation class >> anyProportion: analysisPath [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| anyProportion projectName analysis b ds|
	analysis := analysisPath asFileReference
	readStreamDo: [ :readStream |
		(NeoCSVReader on: readStream)
			skipHeader;
			addField;
			addIntegerField;
			addIntegerField;
			addFloatField;
			addIntegerField;
			addIntegerField;
			addIntegerField;
			addIntegerField;
			addFloatField;
			addIntegerField;
			addIntegerField;
			addFloatField;
			upToEnd ].
		

b := RTGrapher new.
b extent: 1000 @ 100.
ds := RTData new.

ds interaction popup.

ds points: analysis.
ds barChartWithBarTitle: [:c | c at:1].

"The height of a bar will be the number of methods (defined in the instance side)"
ds y: [ :c | c at: 12 ].

"We set a color of the rectangle"
ds dotShape rectangle color: Color blue.

"Set the width of a bar"
ds barShape
	color: Color blue;
	width: 10.
b add: ds.
b axisX.
b axisYWithNumberOfTicks: 4.
^ b
		
]

{ #category : #'as yet unclassified' }
ProjectVisualisation class >> classesByNumberOfMethods: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| view classes cShape es|
	
	classes := model allClasses.
	view := RTView new.

	cShape := RTCompositeShape new.
	
	cShape add: (RTLabel new text: [ :aValue |  aValue name ]).
	cShape add: (RTEllipse new size: [:class | class methods size]).
	cShape vertical.
	
	es := cShape elementsOn: classes.
	
	view addAll: es.
	RTGridLayout on: es.
	^view
]

{ #category : #'as yet unclassified' }
ProjectVisualisation class >> seeGodClasses: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| classes view cShape es ratio m|
	classes := model allClasses.
	ratio := (classes size) * (40/100).
	view := RTView new.

	cShape := RTCompositeShape new.
	

	cShape add: (RTEllipse new size: [:class | class methods size * 2 + 1]; color: [:class| m := GodClassDetector isGodClass: class forRatio: ratio. m ifTrue:[Color red] ifFalse:[Color blue]]).

	
	es := cShape elementsOn: classes.
	RTEdgeBuilder new
		view: view;
		elements: es;
		connectFrom: [ :class | class superclass ].

	view addAll: es.
	RTClusterLayout new on: es.
	^view
]
