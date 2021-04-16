"
Tests basic functionality of the JbMockUIManagerNumbers class.
"
Class {
	#name : #JbMockUIManagerNumbersTest,
	#superclass : #TestCase,
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #tests }
JbMockUIManagerNumbersTest >> testCorrectResponseSequence [

	| mumn |
	mumn := JbMockUIManagerNumbers new.
	self assert: (mumn request: 'Test') equals: '75'.
	self assert: (mumn request: 'Test') equals: '50'.
	self assert: (mumn request: 'Test') equals: '50'.
]
