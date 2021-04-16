Extension { #name : #JbReturnStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbReturnStatementNode >> executeIn: anEnvironment [
	"Store value in exception object. Throw exception. Catch in call:in:."
	
	| retVal jbe |
	retVal := expression evaluateIn: anEnvironment.
	jbe := JbException new.
	jbe returnValue: retVal.
	jbe signal.
]
