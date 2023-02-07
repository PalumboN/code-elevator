Class {
	#name : #ElevatorTest,
	#superclass : #TestCase,
	#instVars : [
		'elevator'
	],
	#category : #'Code-Elevator'
}

{ #category : #tests }
ElevatorTest >> assertCommand: nextCommand equals: class [

	self assert: nextCommand class equals: class
]

{ #category : #running }
ElevatorTest >> setUp [

	super setUp.

	elevator := Elevator new
]

{ #category : #tests }
ElevatorTest >> testElevatorCalledManyTimes [

	self assertCommand: elevator nextCommand equals: Nothing.

	elevator call: 5.
	elevator executeCommand.
	elevator call: 3.
	elevator executeCommand.
	elevator call: 3.
	elevator executeCommand.
	elevator executeCommand.
	elevator executeCommand.
	elevator executeCommand.

	self assert: elevator calls size equals: 3.
	self assert: elevator currentFloor equals: 5.

	elevator userHasEntered.

	self assert: elevator people equals: 1.
	self assertCollection: elevator floorCalls hasSameElements: { 3. 3 }.

	elevator go: 3.
	self
		assertCollection: elevator floorCalls
		hasSameElements: { 3. 3. 3 }.

	elevator executeCommand.
	elevator executeCommand.
	elevator executeCommand.
	elevator executeCommand.

	self assert: elevator currentFloor equals: 3.
	self assert: elevator people equals: 1.

	elevator userHasEntered.
	elevator go: 2.
	elevator userHasEntered.
	elevator go: 0.
	elevator userHasExit.
	elevator call: 2.

	self assert: elevator people equals: 2.
	self
		assertCollection: elevator floorCalls
		hasSameElements: { 2. 0. 2 }.

	elevator executeCommand.
	elevator executeCommand.
	elevator executeCommand.

	self assert: elevator currentFloor equals: 2.

	elevator userHasExit.
	elevator userHasEntered.

	self assert: elevator people equals: 2.
	self assertCollection: elevator floorCalls hasSameElements: { 0 }.


	elevator go: 0.
	elevator call: 0.

	self assert: elevator people equals: 2.
	self
		assertCollection: elevator floorCalls
		hasSameElements: { 0. 0. 0 }
]

{ #category : #tests }
ElevatorTest >> testElevatorGoesDownAndPeopleExit [

	elevator currentFloor: 3.
	elevator people: 1.
	self assertCommand: elevator nextCommand equals: Nothing.
	elevator go: 1.
	self assertCommand: elevator nextCommand equals: Down.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 2.
	self assertCommand: elevator nextCommand equals: Down.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 1.
	self assertCommand: elevator nextCommand equals: Open.
	elevator userHasExit.
	self assert: elevator people equals: 0.
	self assertCommand: elevator nextCommand equals: Nothing.
	elevator executeCommand.
	self assertCommand: elevator nextCommand equals: Nothing
]

{ #category : #tests }
ElevatorTest >> testElevatorIsCalledDown [

	elevator currentFloor: 3.
	elevator call: 1.
	self assertCommand: elevator nextCommand equals: Down
]

{ #category : #tests }
ElevatorTest >> testElevatorIsCalledTwice [

	self assert: elevator currentFloor equals: 0.
	elevator open: true.
	elevator call: 3.
	self assertCommand: elevator nextCommand equals: Close.
	elevator call: 5.
	self assertCommand: elevator nextCommand equals: Close.
	elevator executeCommand.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 1.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 2.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 3.
	self assertCommand: elevator nextCommand equals: Open.
	elevator executeCommand.
	self assertCommand: elevator nextCommand equals: Nothing.
	elevator userHasEntered.
	self assert: elevator people equals: 1.
	self assertCommand: elevator nextCommand equals: Close.
	elevator executeCommand.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 4.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 5.
	self assertCommand: elevator nextCommand equals: Open
]

{ #category : #tests }
ElevatorTest >> testElevatorIsCalledUp [

	elevator call: 3.
	self assertCommand: elevator nextCommand equals: Up
]

{ #category : #tests }
ElevatorTest >> testElevatorIsCalledUpAndPeopleEnter [

	self assert: elevator currentFloor equals: 0.
	elevator call: 3.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 1.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 2.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 3.
	self assertCommand: elevator nextCommand equals: Open.
	elevator executeCommand.
	self assertCommand: elevator nextCommand equals: Nothing.
	elevator userHasEntered.
	self assert: elevator people equals: 1.
	self assertCommand: elevator nextCommand equals: Close.
	elevator executeCommand.
	self assertCommand: elevator nextCommand equals: Nothing.
	
]

{ #category : #tests }
ElevatorTest >> testElevatorIsCalledZero [

	elevator open: true.
	elevator call: 0.
	self assertCommand: elevator nextCommand equals: Nothing
]

{ #category : #tests }
ElevatorTest >> testElevatorIsOpenAndCall [

	elevator currentFloor: 1.
	elevator open: true.
	self assertCommand: elevator nextCommand equals: Nothing.
	elevator call: 3.
	self assertCommand: elevator nextCommand equals: Close.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 1.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 2.
	self assertCommand: elevator nextCommand equals: Up.
	elevator executeCommand.
	self assert: elevator currentFloor equals: 3.
	self assertCommand: elevator nextCommand equals: Open.

]

{ #category : #tests }
ElevatorTest >> testPerformance [

	
]
