"
Tests the JbException class used to return function return values.
"
Class {
	#name : #JbExceptionTest,
	#superclass : #TestCase,
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #tests }
JbExceptionTest >> testJbReturnStatementNodeThrowsJbException [

	| jbrsn jbcen retVal |
	retVal := 0.
	jbcen := JbConstantExpressionNode new.
	jbcen value: 3.
	jbrsn := JbReturnStatementNode new.
	jbrsn expression: jbcen.
	[ jbrsn executeIn: JbEnvironment new ] on: JbException do: [ :ex | retVal := ex returnValue ].
	self assert: retVal equals: 3.
	
]

{ #category : #tests }
JbExceptionTest >> testReturnValueSetterAndGetter [

	| jbe |
	jbe := JbException new.
	self assert: jbe returnValue equals: nil.
	jbe returnValue: 123.
	self assert: jbe returnValue equals: 123.
	jbe returnValue: 'This is a string'.
	self assert: jbe returnValue equals: 'This is a string'.
	jbe returnValue: true.
	self assert: jbe returnValue.
]
