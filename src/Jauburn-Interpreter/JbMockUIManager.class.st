"
A mock UIManager for testing JAuburn components that rely on a UIManager.
"
Class {
	#name : #JbMockUIManager,
	#superclass : #Object,
	#instVars : [
		'prompt',
		'response'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
JbMockUIManager >> default [ 

	^self
]

{ #category : #accessing }
JbMockUIManager >> initialize [ 

	prompt := 'This is a test prompt.'.
	response := 'This is a test response.'.
]

{ #category : #accessing }
JbMockUIManager >> prompt [

	^prompt.
]

{ #category : #accessing }
JbMockUIManager >> prompt: aString [ 

	prompt := aString.
]

{ #category : #accessing }
JbMockUIManager >> request: aString [ 

	prompt := aString.
	^response.
]

{ #category : #accessing }
JbMockUIManager >> response [ 

	^response.
]

{ #category : #accessing }
JbMockUIManager >> response: aString [ 

	response := aString.
]
