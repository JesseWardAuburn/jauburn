"
A JAuburn AST node to handle function definition (e.g., var func = function() { return 3; };).
"
Class {
	#name : #JbFunctionNode,
	#superclass : #Object,
	#instVars : [
		'body',
		'parameters'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionNode >> body [
	^ body
]

{ #category : #accessing }
JbFunctionNode >> body: anObject [
	body := anObject
]

{ #category : #accessing }
JbFunctionNode >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunctionNode >> parameters: anObject [
	parameters := anObject
]
