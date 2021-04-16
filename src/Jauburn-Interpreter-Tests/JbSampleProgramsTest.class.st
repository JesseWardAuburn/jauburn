"
Tests the sample programs associated with the JbSamplePrograms class.
"
Class {
	#name : #JbSampleProgramsTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'interpreter'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #running }
JbSampleProgramsTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new.
]

{ #category : #tests }
JbSampleProgramsTest >> testGcd [

	interpreter run: JbSamplePrograms gcd.
	interpreter run: 'var x = gcd(1, 1);'.
	self assert: (interpreter environment at: 'x') equals: 1.
	interpreter run: 'x = gcd(50, 75);'.
	self assert: (interpreter environment at: 'x') equals: 25.
	interpreter run: 'x = gcd(75, 25);'.
	self assert: (interpreter environment at: 'x') equals: 25.
	interpreter run: 'x = gcd(100, 99);'.
	self assert: (interpreter environment at: 'x') equals: 1.
	interpreter run: 'x = gcd(99, 100);'.
	self assert: (interpreter environment at: 'x') equals: 1.
]

{ #category : #tests }
JbSampleProgramsTest >> testGcdInteractive [

	| expectedOutputTranscript |
	interpreter transcript: JbMockTranscript new.
	interpreter uimanager: JbMockUIManagerNumbers new.
	interpreter run: JbSamplePrograms gcd.
	interpreter run: JbSamplePrograms gcdInteractiveBody.
	
	expectedOutputTranscript := JbMockTranscript new.
	expectedOutputTranscript show: 'The gcd of 'printString.
	expectedOutputTranscript show: 75 printString.
	expectedOutputTranscript show: ' and ' printString.
	expectedOutputTranscript show: 50 printString.
	expectedOutputTranscript show: ' is: ' printString.
	expectedOutputTranscript show: 25 printString.
	expectedOutputTranscript show: '' printString.
	expectedOutputTranscript show: Character cr.
	
	self assert: interpreter transcript contents equals: expectedOutputTranscript contents.
]

{ #category : #tests }
JbSampleProgramsTest >> testSqrt [

	| muim expectedOutputTranscript |
	interpreter transcript: JbMockTranscript new.
	muim := JbMockUIManager new.
	muim response: '4'.
	interpreter uimanager: muim.
	interpreter run: JbSamplePrograms sqrtBody.
	
	expectedOutputTranscript := JbMockTranscript new.
	expectedOutputTranscript show: 'Starting approximation: 'printString.
	expectedOutputTranscript show: 2.0 printString.
	expectedOutputTranscript show: '' printString.
	expectedOutputTranscript show: Character cr.
	expectedOutputTranscript show: 'Iteration ' printString.
	expectedOutputTranscript show: 1 printString.
	expectedOutputTranscript show: ': ' printString.
	expectedOutputTranscript show: 2.0 printString.
	expectedOutputTranscript show: '' printString.
	expectedOutputTranscript show: Character cr.
	expectedOutputTranscript show: 'Final approximation: ' printString.
	expectedOutputTranscript show: 2.0 printString.
	expectedOutputTranscript show: '' printString.
	expectedOutputTranscript show: Character cr.
	
	self assert: interpreter transcript contents equals: expectedOutputTranscript contents.
]
