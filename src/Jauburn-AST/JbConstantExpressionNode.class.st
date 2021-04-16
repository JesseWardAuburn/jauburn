"
A JAuburn AST node to hold constant values (e.g., 3).
"
Class {
	#name : #JbConstantExpressionNode,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbConstantExpressionNode >> value [
	^ value
]

{ #category : #accessing }
JbConstantExpressionNode >> value: anObject [
	value := anObject
]
