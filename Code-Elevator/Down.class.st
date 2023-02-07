Class {
	#name : #Down,
	#superclass : #ElevatorCommand,
	#category : #'Code-Elevator'
}

{ #category : #asd }
Down >> executeOn: anElevator [

	anElevator goDown
]
