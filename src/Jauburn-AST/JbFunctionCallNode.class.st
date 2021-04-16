"
A JAuburn AST node to handle function calls, either as a statement (e.g., func();) or an expression (e.g., var x = func();).
"
Class {
	#name : #JbFunctionCallNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'arguments'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionCallNode >> arguments [
	^ arguments
]

{ #category : #accessing }
JbFunctionCallNode >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
JbFunctionCallNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbFunctionCallNode >> identifier: anObject [
	identifier := anObject
]
