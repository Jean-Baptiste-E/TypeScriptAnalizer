Class {
	#name : #GlobalParametersAnalizer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
GlobalParametersAnalizer class >> getGlobalParameters: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| globalParameters |
	globalParameters:= OrderedCollection  new.
	globalParameters add: model numberOfClasses.
	globalParameters add: model numberOfMethods.
	
	^globalParameters 
]
