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

	elevator currentFloor: 3.
	elevator people: 1.
	elevator go: 1.
	
	
]
