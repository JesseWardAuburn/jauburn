"
A JAuburn AST node to handle if statements (e.g., if (x == 3) { result = 7; };).
"
Class {
	#name : #JbIfNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'trueStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIfNode >> condition [
	^ condition
]

{ #category : #accessing }
JbIfNode >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
JbIfNode >> trueStatements [
	^ trueStatements
]

{ #category : #accessing }
JbIfNode >> trueStatements: anObject [
	trueStatements := anObject
]
