Class {
	#name : #CSVWriter,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
CSVWriter >> write: data withHeaders: headers [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
				
	'DemoAnalysis.csv' asFileReference
	writeStreamDo: [ :writeStream |
		(NeoCSVWriter on: writeStream)
 			writeHeader: headers;
			nextPutAll:  data ].
		
]
