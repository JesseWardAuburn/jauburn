"
Tests basic functionality of the JbMockUIManager.
"
Class {
	#name : #JbMockUIManagerTest,
	#superclass : #TestCase,
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #tests }
JbMockUIManagerTest >> testDefault [ 

	| mum |
	mum := JbMockUIManager new.
	self assert: mum default equals: mum.
]

{ #category : #tests }
JbMockUIManagerTest >> testPromptSetterAndGetter [

	| mum |
	mum := JbMockUIManager new.
	mum prompt: 'This is a new prompt.'.
	self assert: mum prompt equals: 'This is a new prompt.'.
	mum prompt: ''.
	self assert: mum prompt equals: ''.
]

{ #category : #tests }
JbMockUIManagerTest >> testProperInitialization [

	| mum |
	mum := JbMockUIManager new.
	self assert: mum prompt equals: 'This is a test prompt.'.
	self assert: mum response equals: 'This is a test response.'.
]

{ #category : #tests }
JbMockUIManagerTest >> testRequest [

	| mum |
	mum := JbMockUIManager new.
	self assert: (mum request: 'This is a new prompt.') equals: 'This is a test response.'.
	self assert: mum prompt equals: 'This is a new prompt.'.
]

{ #category : #tests }
JbMockUIManagerTest >> testResponseSetterAndGetter [

	| mum |
	mum := JbMockUIManager new.
	mum response: 'This is a new response.'.
	self assert: mum response equals: 'This is a new response.'.
	mum response: ''.
	self assert: mum response equals: ''.
]
