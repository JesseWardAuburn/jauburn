"
A JAuburn AST node that serves as the root node for an entire program, defined here as a list of statements.
"
Class {
	#name : #JbProgramNode,
	#superclass : #Object,
	#instVars : [
		'statements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbProgramNode >> statements [
	^ statements
]

{ #category : #accessing }
JbProgramNode >> statements: anObject [
	statements := anObject
]
