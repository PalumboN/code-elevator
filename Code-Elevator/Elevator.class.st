Class {
	#name : #Elevator,
	#superclass : #Object,
	#instVars : [
		'currentFloor',
		'nextCommand',
		'people',
		'calls',
		'isOpen'
	],
	#category : #'Code-Elevator'
}

{ #category : #asd }
Elevator >> calculateNextCommand [

	| nextCall currentCalls |
	currentCalls := self calls.
	self isOpen ifTrue: [ 
		currentCalls ifEmpty: [ ^ Close new ].
		"If it is in the same floor, we should wait"
		currentCalls first floor = currentFloor
			ifTrue: [ ^ Nothing new ]
			ifFalse: [ ^ Close new ] ].

	currentCalls ifEmpty: [ ^ Nothing new ].

	nextCall := currentCalls first.
	nextCall floor > currentFloor ifTrue: [ ^ Up new ].
	nextCall floor < currentFloor ifTrue: [ ^ Down new ].
	nextCall floor = currentFloor ifTrue: [ ^ Open new ]
]

{ #category : #'as yet unclassified' }
Elevator >> call: aFloor [

	calls add: (Call new
			 floor: aFloor;
			 direction: Up new;
			 yourself).
	nextCommand := self calculateNextCommand
]

{ #category : #accessing }
Elevator >> calls [

	^ calls sorted: [ :a :b |
		  (currentFloor - a floor) abs < (currentFloor - b floor) abs ]
]

{ #category : #'as yet unclassified' }
Elevator >> close [

	nextCommand := Close new
]

{ #category : #accessing }
Elevator >> currentFloor [

	^ currentFloor
]

{ #category : #accessing }
Elevator >> currentFloor: anObject [

	currentFloor := anObject
]

{ #category : #asd }
Elevator >> executeCommand [

	nextCommand executeOn: self.
	nextCommand := self calculateNextCommand
]

{ #category : #quering }
Elevator >> floorCalls [

	^ self calls collect: #floor
]

{ #category : #asd }
Elevator >> go: aFloor [

	calls add: (Call new
			 floor: aFloor;
			 direction: Nothing new;
			 yourself).

	nextCommand := self calculateNextCommand
]

{ #category : #'as yet unclassified' }
Elevator >> goDown [

	currentFloor := currentFloor - 1
]

{ #category : #'as yet unclassified' }
Elevator >> goUp [

	currentFloor := currentFloor + 1
]

{ #category : #initialization }
Elevator >> initialize [

	nextCommand := Nothing new.
	currentFloor := 0.
	people := 0.
	isOpen := false.
	calls := OrderedCollection new
]

{ #category : #accessing }
Elevator >> isOpen [

	^ isOpen
]

{ #category : #accessing }
Elevator >> nextCommand [

	^ nextCommand
]

{ #category : #accessing }
Elevator >> nextCommand: anObject [

	nextCommand := anObject
]

{ #category : #'as yet unclassified' }
Elevator >> nothing [

	nextCommand := Nothing new
]

{ #category : #'as yet unclassified' }
Elevator >> open [

	nextCommand := Open new
]

{ #category : #asd }
Elevator >> open: aBoolean [ 
	
	isOpen := aBoolean
]

{ #category : #accessing }
Elevator >> people [

	^ people
]

{ #category : #accessing }
Elevator >> people: anObject [

	people := anObject
]

{ #category : #accessing }
Elevator >> removeCall: aCall [

	calls remove: aCall
]

{ #category : #asd }
Elevator >> userHasEntered [

	self removeCall: (self calls detect: [ :c | c floor = currentFloor ]).
	people := people + 1.
	nextCommand := self calculateNextCommand
]

{ #category : #asd }
Elevator >> userHasExit [

	self removeCall: (self calls detect: [ :c | c floor = currentFloor ]).
	people := people - 1.
	nextCommand := self calculateNextCommand
]
