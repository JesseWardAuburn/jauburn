Extension { #name : #JbFunctionCallNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> evaluateIn: environment [

	| func executeEnvironment |
	func := environment at: self identifier.
	[ executeEnvironment := func environment ] on: Exception do: [ :ex | executeEnvironment := environment ].
	^func call: self arguments in: executeEnvironment.
]

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> executeIn: environment [

	| func executeEnvironment |
	func := environment at: self identifier.
	[ executeEnvironment := func environment ] on: Exception do: [ :ex | executeEnvironment := environment ].
	^func call: self arguments in: executeEnvironment.
]
