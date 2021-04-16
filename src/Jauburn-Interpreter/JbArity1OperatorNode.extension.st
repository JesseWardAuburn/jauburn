Extension { #name : #JbArity1OperatorNode }

{ #category : #'*Jauburn-Interpreter' }
JbArity1OperatorNode >> evaluateIn: environment [

	| operandVal |
	operandVal := self operand evaluateIn: environment.
	operator = $-
		ifTrue: [ ^operandVal negated ]
]
