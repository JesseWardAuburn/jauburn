"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment',
		'transcript',
		'uimanager'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #primitives }
JbInterpreter >> absBinding [

	^#abs -> [ :f | f abs ].
]

{ #category : #primitives }
JbInterpreter >> concatBinding [

	^#concat -> [ :s1 :s2 | s1 , s2 ].
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	(self class selectors select: [ :each | each endsWith: 'Binding' ])
		do: [ :s | 
				| binding primitive |
				binding := self perform: s.
				primitive := JbPrimitive new.
				primitive block: binding value.
				environment at: binding key put: primitive ].
]

{ #category : #primitives }
JbInterpreter >> inputBinding [

	^#input -> [ :prompt | 
		| userEntry |
		userEntry := self uimanager default request: prompt.
		userEntry.
	]
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #primitives }
JbInterpreter >> lengthBinding [

	^#length -> [ :s | s size ].
]

{ #category : #primitives }
JbInterpreter >> modBinding [

	^#mod -> [ :a :b | a \\ b ].
]

{ #category : #primitives }
JbInterpreter >> notBinding [

	^#not -> [ :b | b not ].
]

{ #category : #primitives }
JbInterpreter >> printBinding [

	^#print -> [ :value | self transcript show: value printString ].
]

{ #category : #primitives }
JbInterpreter >> printlnBinding [

	^#println -> [ :value | self transcript show: value printString; cr ].
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]

{ #category : #primitives }
JbInterpreter >> stringToNumberBinding [

	^#stringToNumber -> [ :s | s asNumber ].
]

{ #category : #accessing }
JbInterpreter >> transcript [ 

	^transcript ifNil: [ Transcript ]
]

{ #category : #accessing }
JbInterpreter >> transcript: aTranscript [

	transcript := aTranscript.
]

{ #category : #accessing }
JbInterpreter >> uimanager [

	^uimanager ifNil: [ UIManager ]
]

{ #category : #accessing }
JbInterpreter >> uimanager: aUIManager [

	uimanager := aUIManager.
]
