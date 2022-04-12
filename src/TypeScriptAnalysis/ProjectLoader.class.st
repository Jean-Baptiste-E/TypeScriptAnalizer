Class {
	#name : #ProjectLoader,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
ProjectLoader >> loadProject: path [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	path asFileReference readStreamDo: [ :stream | |model| model:= FamixTypeScriptModel new importFromJSONStream: stream. ^model]
	
]
