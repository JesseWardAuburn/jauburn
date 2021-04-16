"
Tests the JbInterpreter.
"
Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #running }
JbInterpreterTest >> testClosuresWorkCorrectly [

	self interpret: 'var make_counter = function() {var c = 0; return function() { c = c + 1; return c;};};'.
	self interpret: 'var c1 = make_counter();'.
	self interpret: 'var c2 = make_counter();'.
	self interpret: 'var c1res = c1();'.
	self interpret: 'var c2res = c2();'.
	self assert: (interpreter environment at: 'c1res') equals: 1.
	self assert: (interpreter environment at: 'c2res') equals: 1.
	self interpret: 'c1res = c1();'.
	self interpret: 'c1res = c1();'.
	self interpret: 'c2res = c2();'.
	self assert: (interpreter environment at: 'c1res') equals: 3.
	self assert: (interpreter environment at: 'c2res') equals: 2.
	
]

{ #category : #tests }
JbInterpreterTest >> testCorrectAdditionEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 + 3') evaluateIn: interpreter environment.
	self assert: retVal equals: 5.
	retVal := (parser expression parse: '0 + 3') evaluateIn: interpreter environment.
	self assert: retVal equals: 3.
	retVal := (parser expression parse: '2 + 0') evaluateIn: interpreter environment.
	self assert: retVal equals: 2.
	retVal := (parser expression parse: '0 + 0') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectDivisionEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 / 4') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.5.
	retVal := (parser expression parse: '2 / 1') evaluateIn: interpreter environment.
	self assert: retVal equals: 2.
	retVal := (parser expression parse: '4 / 4') evaluateIn: interpreter environment.
	self assert: retVal equals: 1.
	self should: [ (parser expression parse: '2 / 0') evaluateIn: interpreter environment ] raise: ZeroDivide.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectEqualityEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 == 4') evaluateIn: interpreter environment.
	self deny: retVal.
	retVal := (parser expression parse: '2 == 2') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '2 == 0') evaluateIn: interpreter environment.
	self deny: retVal.
	retVal := (parser expression parse: '2 == 4 - 2') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '2 == 4 / 2') evaluateIn: interpreter environment.
	self assert: retVal.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectGreaterThanEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 > 4') evaluateIn: interpreter environment.
	self deny: retVal.
	retVal := (parser expression parse: '2 > 2') evaluateIn: interpreter environment.
	self deny: retVal.
	retVal := (parser expression parse: '2 > 0') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '1/2 > 1/100') evaluateIn: interpreter environment.
	self assert: retVal.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectGreaterThanOrEqualToEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 >= 4') evaluateIn: interpreter environment.
	self deny: retVal.
	retVal := (parser expression parse: '2 >= 2') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '2 >= 0') evaluateIn: interpreter environment.
	self assert: retVal.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectLessThanEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 < 4') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '2 < 2') evaluateIn: interpreter environment.
	self deny: retVal.
	retVal := (parser expression parse: '2 < 0') evaluateIn: interpreter environment.
	self deny: retVal.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectLessThanOrEqualToEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 <= 4') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '2 <= 2') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '2 <= 0') evaluateIn: interpreter environment.
	self deny: retVal.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectMultiplicationEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 * 3') evaluateIn: interpreter environment.
	self assert: retVal equals: 6.
	retVal := (parser expression parse: '1 * 3') evaluateIn: interpreter environment.
	self assert: retVal equals: 3.
	retVal := (parser expression parse: '2 * 1') evaluateIn: interpreter environment.
	self assert: retVal equals: 2.
	retVal := (parser expression parse: '0 * 3') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.
	retVal := (parser expression parse: '2 * 0') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.
	retVal := (parser expression parse: '1 * 1') evaluateIn: interpreter environment.
	self assert: retVal equals: 1.
	retVal := (parser expression parse: '0 * 0') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectNegationEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '-3') evaluateIn: interpreter environment.
	self assert: retVal equals: -3.
	retVal := (parser expression parse: '-(-3)') evaluateIn: interpreter environment.
	self assert: retVal equals: 3.
	retVal := (parser expression parse: '-0') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.
	retVal := (parser expression parse: '-(-0)') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectNotEqualToEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 != 4') evaluateIn: interpreter environment.
	self assert: retVal.
	retVal := (parser expression parse: '2 != 2') evaluateIn: interpreter environment.
	self deny: retVal.
	retVal := (parser expression parse: '2 != 0') evaluateIn: interpreter environment.
	self assert: retVal.
]

{ #category : #tests }
JbInterpreterTest >> testCorrectSubtractionEvaluation [
	
	| retVal |
	retVal := (parser expression parse: '2 - 3') evaluateIn: interpreter environment.
	self assert: retVal equals: -1.
	retVal := (parser expression parse: '3 - 2') evaluateIn: interpreter environment.
	self assert: retVal equals: 1.
	retVal := (parser expression parse: '2 - 2') evaluateIn: interpreter environment.
	self assert: retVal equals: 0.
	retVal := (parser expression parse: '0 - 3') evaluateIn: interpreter environment.
	self assert: retVal equals: -3.
	retVal := (parser expression parse: '2 - 0') evaluateIn: interpreter environment.
	self assert: retVal equals: 2.
]

{ #category : #running }
JbInterpreterTest >> testCorrectVariableAssignment [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	self interpret: 'x = 7;'.
	self assert: (interpreter environment at: 'x') equals: 7.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6; var y = 2 * x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #running }
JbInterpreterTest >> testFunctionCallReturnsCorrectValue [

	self interpret: 'var return2 = function(z) {return 1 + z;};'.
	self interpret: 'var return3 = function() {return 6 / 2;};'.
	self interpret: 'var t = function(x, y) {
		var t1 = return2(100);
		var t2 = return3();
		return x * t1 + y * t2;
	};'.
	self interpret: 'var z = t(2, 7);'.
	self assert: (interpreter environment at: 'z') equals: 223.
]

{ #category : #running }
JbInterpreterTest >> testFunctionStatementsWorkCorrectly [

	self interpret: 'var x = 1; var alterx = function() {x = 2;}; alterx();'.
	self assert: (interpreter environment at: 'x') equals: 2.
]

{ #category : #running }
JbInterpreterTest >> testIfElseFunctionsWorkCorrectly [

	self interpret: 'var choice = function(x) {if (x == 1) {return 7;} else {return 5;}};'.
	self interpret: 'var result = choice(1);'.
	self assert: (interpreter environment at: 'result') equals: 7.
	self interpret: 'var result = choice(99);'.
	self assert: (interpreter environment at: 'result') equals: 5.
]

{ #category : #running }
JbInterpreterTest >> testIfElseStatementsWorkCorrectly [

	self interpret: 'var result = 0;'.
	self interpret: 'var x = 7;'.
	self interpret: 'if (x > 6) {result = 1;} else {result = 2;};'.
	self assert: (interpreter environment at: 'result') equals: 1.
	self interpret: 'if (x > 100) {result = 3;} else {result = 4;};'.
	self assert: (interpreter environment at: 'result') equals: 4.
]

{ #category : #running }
JbInterpreterTest >> testIfStatementsWorkCorrectly [

	self interpret: 'var result = 0;'.
	self interpret: 'var x = 7;'.
	self interpret: 'if (x > 6) {result = 1;};'.
	self assert: (interpreter environment at: 'result') equals: 1.
	self interpret: 'if (x == 7) {result = 2;};'.
	self assert: (interpreter environment at: 'result') equals: 2.
	self interpret: 'if (x < 6) {result = 3;};'.
	self assert: (interpreter environment at: 'result') equals: 2.
]

{ #category : #running }
JbInterpreterTest >> testNestedFunctionsReturnCorrectValue [

	self interpret: 'var function1 = function() {return function2();};'.
	self interpret: 'var function2 = function() {return function3();};'.
	self interpret: 'var function3 = function() {return 99;};'.
	self interpret: 'var z = function1();'.
	self assert: (interpreter environment at: 'z') equals: 99.
]

{ #category : #running }
JbInterpreterTest >> testWhileLoopWorksCorrectly [

	self interpret: 'var sum = 0;'.
	self interpret: 'var i = 1;'.
	self interpret: 'while (i <= 10) {
		sum = sum + i;
		i = i + 1;
	}'.
	self assert: (interpreter environment at: 'sum') equals: 55.
	self assert: (interpreter environment at: 'i') equals: 11.
]
