Class {
	#name : #HeavyMethodDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
HeavyMethodDetector class >> getHeavyMethods: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	^(model allMethods select: [ :each | each numberOfParameters > 3 ]) size .
]

{ #category : #'as yet unclassified' }
HeavyMethodDetector class >> getLazyClasses: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"
	| count |
	count := model allClasses select: [ :each | each numberOfMethods < 2].
	^count size asFloat
]
