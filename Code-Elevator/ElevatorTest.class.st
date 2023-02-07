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
	self assertCommand: elevator nextCommand equals: Close.
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
	self assertCommand: elevator nextCommand equals: Open.
	elevator userHasEntered.
	self assert: elevator people equals: 1.
	self assertCommand: elevator nextCommand equals: Close.
	elevator executeCommand.
	self assertCommand: elevator nextCommand equals: Nothing.
	
]
