Extension { #name : #JbFunctionNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionNode >> evaluateIn: environment [

	^JbFunction new 
		body: self body;
		environment: environment;
		parameters: (self parameters collect: [ :paramNode | paramNode identifier ]).
]
