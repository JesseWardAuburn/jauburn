"
Tests all the primitive functions of JAuburn.
"
Class {
	#name : #JbPrimitivesTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #running }
JbPrimitivesTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new.
	interpreter transcript: JbMockTranscript new.
	interpreter uimanager: JbMockUIManager new.
	
]

{ #category : #tests }
JbPrimitivesTest >> testAbs [

	interpreter run: 'var x = abs(-99);'.
	self assert: (interpreter environment at: 'x') equals: 99.
	interpreter run: 'x = abs(1);'.
	self assert: (interpreter environment at: 'x') equals: 1.
	interpreter run: 'x = abs(0);'.
	self assert: (interpreter environment at: 'x') equals: 0.
	interpreter run: 'x = abs(-1/2);'.
	self assert: (interpreter environment at: 'x') equals: 0.5.
]

{ #category : #tests }
JbPrimitivesTest >> testConcat [

	interpreter run: 'var aString = concat("ABC", "123");'.
	self assert: (interpreter environment at: 'aString') equals: 'ABC123'.
]

{ #category : #tests }
JbPrimitivesTest >> testInput [

	interpreter run: 'var response = input("Enter some input:");'.
	self assert: (interpreter environment at: 'response') equals: 'This is a test response.'.
]

{ #category : #tests }
JbPrimitivesTest >> testLength [

	interpreter run: 'var len = length("I am the very model of a modern major general");'.
	self assert: (interpreter environment at: 'len') equals: 45.
	interpreter run: 'len = length("");'.
	self assert: (interpreter environment at: 'len') equals: 0.
]

{ #category : #tests }
JbPrimitivesTest >> testMod [

	interpreter run: 'var x = mod(0, 3);'.
	self assert: (interpreter environment at: 'x') equals: 0.
	interpreter run: 'x = mod(1, 3);'.
	self assert: (interpreter environment at: 'x') equals: 1.
	interpreter run: 'x = mod(2, 3);'.
	self assert: (interpreter environment at: 'x') equals: 2.
	interpreter run: 'x = mod(3, 3);'.
	self assert: (interpreter environment at: 'x') equals: 0.
   interpreter run: 'x = mod(4, 3);'.
	self assert: (interpreter environment at: 'x') equals: 1.
	interpreter run: 'x = mod(5, 3);'.
	self assert: (interpreter environment at: 'x') equals: 2.
	interpreter run: 'x = mod(6, 3);'.
	self assert: (interpreter environment at: 'x') equals: 0.
]

{ #category : #tests }
JbPrimitivesTest >> testNot [

	interpreter run: 'var falseVal = not(true);'.
	self deny: (interpreter environment at: 'falseVal').
	interpreter run: 'var trueVal = not(false);'.
	self assert: (interpreter environment at: 'trueVal').
]

{ #category : #tests }
JbPrimitivesTest >> testPrint [ 

	interpreter run: 'print(123);'.
	self assert: interpreter transcript contents equals: '123'.
]

{ #category : #tests }
JbPrimitivesTest >> testPrintln [

	interpreter run: 'println(123);'.
	self assert: interpreter transcript contents equals: '123' , Character cr asString.
]

{ #category : #tests }
JbPrimitivesTest >> testStringToNumber [

	interpreter run: 'var x = stringToNumber("9001");'.
	self assert: (interpreter environment at: 'x') equals: 9001.
	interpreter run: 'x = stringToNumber("0");'.
	self assert: (interpreter environment at: 'x') equals: 0.
	interpreter run: 'x = stringToNumber("-9001");'.
	self assert: (interpreter environment at: 'x') equals: -9001.
	interpreter run: 'x = stringToNumber("0.5");'.
	self assert: (interpreter environment at: 'x') equals: 0.5.
]
