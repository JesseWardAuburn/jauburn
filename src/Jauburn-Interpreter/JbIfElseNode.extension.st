Extension { #name : #JbIfElseNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfElseNode >> executeIn: environment [

	(condition evaluateIn: environment)
		ifTrue: [ trueStatements do: [ :stmt | stmt executeIn: environment ] ]
		ifFalse: [ falseStatements do: [ :stmt | stmt executeIn: environment ] ].
]
