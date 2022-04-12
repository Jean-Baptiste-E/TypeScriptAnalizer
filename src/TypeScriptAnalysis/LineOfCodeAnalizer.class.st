Class {
	#name : #LineOfCodeAnalizer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer class >> getAverageLineOfCodeByMethod: model [ 
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"
	| average |
	
	model allMethods isEmpty ifTrue: [ ^0 ].
	average := model allMethods average: [ :each | each numberOfLinesOfCode ].
			
	^average asFloat
]

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer class >> getBiggestMethod: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| biggestMethod maxNumberOfLinesOfCode | 
	model allMethods isEmpty ifTrue: [ ^0 ].
	maxNumberOfLinesOfCode := model allMethods max: [ :each | each numberOfLinesOfCode ].
	biggestMethod := model allMethods select: [ :each | each numberOfLinesOfCode = maxNumberOfLinesOfCode ].
	
	^maxNumberOfLinesOfCode  
	
]

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer class >> getLinesOfCodeStats: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
	| data |
	data:= OrderedCollection new.
	data add: (self getAverageLineOfCodeByMethod: model);
		add: (self getMethodCountFrom: model overLOC: 100);
		add: (self getBiggestMethod: model).
 .
	^data 
]

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer class >> getMethodCountFrom: model overLOC: loc [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"
	| count |
	count := model allMethods select: [ :each | each numberOfLinesOfCode > loc].
	^count size asFloat
]
