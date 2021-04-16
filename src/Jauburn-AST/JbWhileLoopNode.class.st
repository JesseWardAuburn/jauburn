"
A JAuburn AST node to handle while loop statements (e.g., while (x < 10) { result = result + 1; x = x + 1; };, where x and result are previously-declared variables).
"
Class {
	#name : #JbWhileLoopNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'statements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbWhileLoopNode >> condition [
	^ condition
]

{ #category : #accessing }
JbWhileLoopNode >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
JbWhileLoopNode >> statements [
	^ statements
]

{ #category : #accessing }
JbWhileLoopNode >> statements: anObject [
	statements := anObject
]
