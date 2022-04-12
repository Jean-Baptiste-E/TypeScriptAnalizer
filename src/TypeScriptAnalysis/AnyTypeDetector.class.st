Class {
	#name : #AnyTypeDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
AnyTypeDetector class >> getAnyStats:  model [ 
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| anyVariables otherVariables proportion collection |
	collection := OrderedCollection new.
	anyVariables := self getNumOfAny: model.
	otherVariables := self getNumOfOtherTypes: model.
	proportion := 0.
	otherVariables = 0
		ifFalse: [ proportion := (anyVariables / otherVariables).].
	
	collection add: anyVariables.
	collection add: proportion asFloat.
	^collection .
	
	

]

{ #category : #'as yet unclassified' }
AnyTypeDetector class >> getNumOfAny:  model [ 
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| numberOfAnyVariable types |
	types := model allTypes.
	numberOfAnyVariable := types select: [ :each | each name = 'any' ].
	numberOfAnyVariable isEmpty 
	ifFalse:  [ numberOfAnyVariable := numberOfAnyVariable at: 1.
				numberOfAnyVariable := numberOfAnyVariable typedEntities size.
				^numberOfAnyVariable  ]
	ifTrue: [ ^0 ]
	
	
	

]

{ #category : #accessing }
AnyTypeDetector class >> getNumOfOtherTypes: model [
	"comment stating purpose of class-side message"

	"scope: class-variables  &  class-instance-variables"

	| numberOfOtherTypeVariables types |
	types := model allTypes.
	types isEmpty 
		ifTrue:[^0].
	numberOfOtherTypeVariables := types sum: [ :each | each typedEntities size ].
	^ numberOfOtherTypeVariables 
]
