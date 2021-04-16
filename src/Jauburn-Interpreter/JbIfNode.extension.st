Extension { #name : #JbIfNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfNode >> executeIn: environment [

	(condition evaluateIn: environment)
		ifTrue: [ trueStatements do: [ :stmt | stmt executeIn: environment ] ].
]
