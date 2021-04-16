"
I am the value that results from evaluating a function.  My i-vars

	parameters -- collection holding names of my parameters 
	environment -- a JbEnvironment instance holding the environment in effect when I was created (closures!)
	body -- an AST node for the body of this function
"
Class {
	#name : #JbFunction,
	#superclass : #Object,
	#instVars : [
		'body',
		'parameters',
		'environment'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
JbFunction >> body [
	^ body
]

{ #category : #accessing }
JbFunction >> body: anObject [
	body := anObject
]

{ #category : #api }
JbFunction >> call: arguments in: callEnvironment [
	
	| newEnv |
	newEnv := JbEnvironment new.
	newEnv outerEnvironment: callEnvironment.
	arguments isEmpty ifFalse: [ 
			| numArgs |
			numArgs := arguments size.
			1 to: numArgs do: [ :i |
				newEnv at: (parameters at: i) 
						 put: ((arguments at: i) evaluateIn: callEnvironment)
			]
	].
	self environment: newEnv.
	[ body do: [ :each | each executeIn: newEnv ] ] on: JbException do: [ :ex | ^(ex returnValue) ].
	
]

{ #category : #accessing }
JbFunction >> environment [
	^ environment
]

{ #category : #accessing }
JbFunction >> environment: anObject [
	environment := anObject
]

{ #category : #accessing }
JbFunction >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunction >> parameters: anObject [
	parameters := anObject
]
