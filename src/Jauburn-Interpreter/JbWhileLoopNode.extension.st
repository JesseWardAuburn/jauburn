Extension { #name : #JbWhileLoopNode }

{ #category : #'*Jauburn-Interpreter' }
JbWhileLoopNode >> executeIn: environment [
	
	[ condition evaluateIn: environment ] whileTrue: [ statements do: [ :stmt | stmt executeIn: environment ] ].
]
