# TypeScriptAnalizer
## Purpose
This package was created for the MGL843 course at ETS Montréal. It aims at detecting the proportions of certain anti-patterns in pure TypeScript and Angular projects.
The detected anti-patterns are the following : 
- Long Method
- Long Parameter List 
- God Class
- Lazy Class
- The any Type ( bad practice in TypeScript ) 
## Requirements
A collection of scripts to conduct analysis on TypeScript Projetcs using Pharo and Moose
This version is developped for [Moose 8.0.2 image](https://github.com/moosetechnology/Moose/releases/download/v8.0.2/Moose8-stable.zip)
This Script relies heavily on the [FamixTypeScript](https://github.com/Arezoo-Nasr/FamixTypeScript) by Arezoo-Nasr. Be sure to have it ready in your image before using.  

## Importing in image 
Please use Iceberg to import it in your image :
Iceberg -> Add -> Clone from github.com -> Onwer name : Jean-Baptiste-E; Project Name : TypeScriptAnalizer.
Be sure to choose the master branch in remote and do not forget to load the package. 

## Conducting an analysis
Analizing prjects first require you to have genereated the JSON files for your projetcs using the [FamixTypeScriptImporter](https://github.com/Arezoo-Nasr/FamixTypeScriptImporter).
Create a folder in your image and put all the JSON in this folder. 
Then in a Moose Playground type :
```smalltalk
TypeScriptAnalyzer new analyzeAllProjects: '<NameOfYourFolder>'. 
```
After completion you will find a ```.csv``` file in your image folder containing all the statistics relevant to the detection of the mentionned Anti-patterns. 

## Visualizations

At the moment only one visualization is available using [Roassal](http://agilevisualization.com/). It allows you to see every class in your project and their inheritance tree. The size of each circle represents the size of each class in terms of number of methods. Finaly red classes have been detected as god classes :
![Visualization example](https://user-images.githubusercontent.com/61498428/163013315-420f27a1-c327-495b-85eb-bd5ca8f49d08.png)

To use this tool open a Moose Playground and type :
```smalltalk
model:= ProjectLoader new loadProject: 'path/of/your/project/JSON.json'.
ProjectVisualisation seeGodClasses: model. 
```
