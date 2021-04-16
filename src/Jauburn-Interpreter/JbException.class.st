"
Handles return values for JAuburn.
"
Class {
	#name : #JbException,
	#superclass : #Exception,
	#instVars : [
		'returnValue'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
JbException >> defaultAction [ 

	UnhandledError signalForException: self.
]

{ #category : #accessing }
JbException >> returnValue [
	^ returnValue
]

{ #category : #accessing }
JbException >> returnValue: anObject [
	returnValue := anObject
]
