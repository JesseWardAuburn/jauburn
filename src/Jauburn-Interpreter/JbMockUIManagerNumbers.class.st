"
A mock UIManager specifically for testing the JAuburn GCD sample program, which requires two input numbers.
"
Class {
	#name : #JbMockUIManagerNumbers,
	#superclass : #JbMockUIManager,
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
JbMockUIManagerNumbers >> initialize [ 
	
	super initialize.
	response := '75'.
	^self.
]

{ #category : #accessing }
JbMockUIManagerNumbers >> request: aString [ 

	| currentResponse |
	prompt := aString.
	currentResponse := response.
	response := '50'.
	^currentResponse.
]
