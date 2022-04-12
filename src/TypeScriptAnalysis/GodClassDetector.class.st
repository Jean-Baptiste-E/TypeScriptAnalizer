Class {
	#name : #GodClassDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
GodClassDetector class >> detectGodClass: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| averageFanOut classesPercentage potentialGodClasses numberOfPotentialGodClasses data|
	data:= OrderedCollection new.
	classesPercentage := (model allClasses size) * (40/100).
	model allClasses isEmpty
		ifFalse: [ 	
				averageFanOut := model allClasses average: [ :each | each fanIn ].
				potentialGodClasses := model allClasses select: [ :each | self isGodClass: each forRatio: 				classesPercentage ].
				numberOfPotentialGodClasses := potentialGodClasses size. ]
		ifTrue: [ averageFanOut := 0. numberOfPotentialGodClasses := 0 ].

	data add: averageFanOut asFloat ;
		add: numberOfPotentialGodClasses.
	^data.
]

{ #category : #testing }
GodClassDetector class >> isGodClass: class forRatio: ratio [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	^ class fanOut > ratio.
]
