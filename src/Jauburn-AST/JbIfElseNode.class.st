"
A JAuburn AST node to handle if-else statements (e.g., if (x == 3) { result = 7; } else { result = 8 };).
"
Class {
	#name : #JbIfElseNode,
	#superclass : #JbIfNode,
	#instVars : [
		'falseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
