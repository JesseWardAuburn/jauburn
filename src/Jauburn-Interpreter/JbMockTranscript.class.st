"
A mock transcript for testing JAuburn functions and primitives that print to the Transcript.
"
Class {
	#name : #JbMockTranscript,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
JbMockTranscript >> contents [ 

	^contents contents.
]

{ #category : #'stop conditions' }
JbMockTranscript >> cr [ 

	contents nextPut: Character cr
]

{ #category : #initialization }
JbMockTranscript >> initialize [ 

	super initialize.
	contents := String new writeStream.
	^self.
]

{ #category : #accessing }
JbMockTranscript >> show: anInput [

	anInput isCollection
		ifTrue: [ contents nextPutAll: anInput. ]
		ifFalse: [ contents nextPut: anInput. ]
	
	
]
