"
A JAuburn AST node to handle identifier expressions (e.g., var y = x;, where x is a previously-defined variable).
"
Class {
	#name : #JbIdentifierExpressionNode,
	#superclass : #Object,
	#instVars : [
		'identifier'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIdentifierExpressionNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbIdentifierExpressionNode >> identifier: anObject [
	identifier := anObject
]
