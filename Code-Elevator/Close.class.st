Class {
	#name : #Close,
	#superclass : #ElevatorCommand,
	#category : #'Code-Elevator'
}

{ #category : #asd }
Close >> executeOn: anElevator [ 

	anElevator open: false
]
