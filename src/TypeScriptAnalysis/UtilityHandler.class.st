Class {
	#name : #UtilityHandler,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
UtilityHandler class >> merge: secondDictionary into: firstDictionary [
	
	secondDictionary keysAndValuesDo: [ :key :value | firstDictionary at: key put: value ].
	^firstDictionary
]
