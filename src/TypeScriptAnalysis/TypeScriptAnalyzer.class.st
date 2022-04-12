Class {
	#name : #TypeScriptAnalyzer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
TypeScriptAnalyzer >> analyzeAllProjects: directoryPath [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| directory projectsCollection headers allProjectsData |
	directory := directoryPath asFileReference. 
	projectsCollection := directory allChildren select: [ :each | each basename endsWith: '.json'].
	

	allProjectsData := projectsCollection collect: [ :each | self analyzeProject: each ].
	
	headers := #('Project Name' 'Classes' 'Methods' 'AVG LOC By Method' 'Methods LOC > 100' 'Bigest Method LOC' 'Lazy classes' 'Methods > 3 parameters' 'Average Class FanOut' 'Potential God Classes' 'Number Of Any variables' 'Proportion of any variables').
	CSVWriter new write: allProjectsData  withHeaders: headers.
		
]

{ #category : #'as yet unclassified' }
TypeScriptAnalyzer >> analyzeProject: path [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	|model headers data finalLine projectData|
	headers := #('Project Name' 'Classes' 'Methods' 'AVG LOC By Method' 'Methods LOC > 100' 'Bigest Method LOC' 'Lazy classes' 'Methods > 3 parameters' 'Average Class FanOut' 'Potential God Classes' 'Number Of Any variables' 'Proportion of any variables').
	projectData:= OrderedCollection new.
	model:= ProjectLoader new loadProject: path	.
	projectData add: model name;
		addAll: (GlobalParametersAnalizer getGlobalParameters: model);
		addAll: (LineOfCodeAnalizer getLinesOfCodeStats: model);
		add: (HeavyMethodDetector getLazyClasses: model);
		add: (HeavyMethodDetector getHeavyMethods: model);
		addAll: (GodClassDetector detectGodClass: model);
		addAll: (AnyTypeDetector  getAnyStats: model).
	"data := OrderedCollection new."
	"data add: projectData."
	"finalLine:= CSVWriter new write: data withHeaders: headers."
	  
	^projectData 
]
