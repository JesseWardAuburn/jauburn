"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> gcd [

	| program |
	program := '
		var gcd = function(a, b) { 
			var result = -1;
			var modResult = -1;
			if (b > a) { 
				modResult = mod(b, a);
				if (modResult == 0) { 
					result = a;
				} else { 
					result = gcd(modResult, a);
				}
			} else { 
				modResult = mod(a, b);
				if (modResult == 0) { 
					result = b;
				} else { 
					result = gcd(b, modResult);
				}
			}
			return result;
		};
	'.
	^program.
]

{ #category : #'sample programs' }
JbSamplePrograms class >> gcdInteractive [

	| program jbi |
	jbi := JbInterpreter new.
	jbi run: JbSamplePrograms gcd.
	program := '
		var numberOne = stringToNumber(input("Enter a number: "));
		var numberTwo = stringToNumber(input("Enter another number: "));
		var result = gcd(numberOne, numberTwo);
		print("The gcd of ");
		print(numberOne);
		print(" and ");
		print(numberTwo);
		print(" is: ");
		print(result);
		println("");
	'.
	jbi run: program.
]

{ #category : #'sample programs' }
JbSamplePrograms class >> gcdInteractiveBody [

	| program |
	program := '
		var numberOne = stringToNumber(input("Enter a number: "));
		var numberTwo = stringToNumber(input("Enter another number: "));
		var result = gcd(numberOne, numberTwo);
		print("The gcd of ");
		print(numberOne);
		print(" and ");
		print(numberTwo);
		print(" is: ");
		print(result);
		println("");
	'.
	^program.
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"

	^'var x = 1;
	  var y = 10 * x - 1;
	  if (y == 9) { 
   	    x = 16;
	  }'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]

{ #category : #'instance creation' }
JbSamplePrograms class >> sqrt [

	| jbi program |
	jbi := JbInterpreter new.
	program := '
		var userInput = input("Enter a number:");
		var S = stringToNumber(userInput);
		var x0 = S / 2;
		var x1 = (x0 + S / x0) / 2;
		var diff = abs(x1 - x0);
		var iteration = 1;
		print("Starting approximation: ");
		print(x0);
		println("");
		print("Iteration ");
			print(iteration);
			print(": ");
			print(x1);
			println("");
			iteration = iteration + 1;
		while (diff > 1 / 1000) {
			x0 = x1;
			x1 = (x0 + S / x0) / 2;
			diff = abs(x1 - x0);
			print("Iteration ");
			print(iteration);
			print(": ");
			print(x1);
			println("");
			iteration = iteration + 1;
	   }
		print("Final approximation: ");
		print(x1);
		println("");
	'.
	jbi run: program.
]

{ #category : #'instance creation' }
JbSamplePrograms class >> sqrtBody [

	| program |
	program := '
		var userInput = input("Enter a number:");
		var S = stringToNumber(userInput);
		var x0 = S / 2;
		var x1 = (x0 + S / x0) / 2;
		var diff = abs(x1 - x0);
		var iteration = 1;
		print("Starting approximation: ");
		print(x0);
		println("");
		print("Iteration ");
			print(iteration);
			print(": ");
			print(x1);
			println("");
			iteration = iteration + 1;
		while (diff > 1 / 1000) {
			x0 = x1;
			x1 = (x0 + S / x0) / 2;
			diff = abs(x1 - x0);
			print("Iteration ");
			print(iteration);
			print(": ");
			print(x1);
			println("");
			iteration = iteration + 1;
	   }
		print("Final approximation: ");
		print(x1);
		println("");
	'.
	^program.
]
