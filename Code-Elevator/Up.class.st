Class {
	#name : #Up,
	#superclass : #ElevatorCommand,
	#category : #'Code-Elevator'
}

{ #category : #asd }
Up >> executeOn: anElevator [ 

	anElevator goUp
]
