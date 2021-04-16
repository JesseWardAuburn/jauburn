"
Tests basic functionality of the JbMockTranscript.
"
Class {
	#name : #JbMockTranscriptTest,
	#superclass : #TestCase,
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #running }
JbMockTranscriptTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
]

{ #category : #tests }
JbMockTranscriptTest >> testMockTranscriptCR [

	| mt |
	mt := JbMockTranscript new.
	mt cr.
	self assert: mt contents equals: (Character cr) asString.
]

{ #category : #tests }
JbMockTranscriptTest >> testMockTranscriptContents [

	| mt |
	mt := JbMockTranscript new.
	self assert: mt contents equals: ''.
	mt show: 'This is a test.'.
	self assert: mt contents equals: 'This is a test.'.
	mt show: ' This is another test.'.
	self assert: mt contents equals: 'This is a test. This is another test.'
]

{ #category : #tests }
JbMockTranscriptTest >> testMockTranscriptInitialization [

	| mt |
	mt := JbMockTranscript new.
	self assert: mt contents equals: ''.
]

{ #category : #tests }
JbMockTranscriptTest >> testMockTranscriptShow [

	| mt |
	mt := JbMockTranscript new.
	mt show: 'This is a test.'.
	self assert: mt contents equals: 'This is a test.'.
]
