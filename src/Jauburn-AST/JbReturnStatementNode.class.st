"
A JAuburn AST node to handle return statements (e.g., return 3;).
"
Class {
	#name : #JbReturnStatementNode,
	#superclass : #Object,
	#instVars : [
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbReturnStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbReturnStatementNode >> expression: anObject [
	expression := anObject
]
