Class {
	#name : #Open,
	#superclass : #ElevatorCommand,
	#category : #'Code-Elevator'
}

{ #category : #asd }
Open >> executeOn: anElevator [

	anElevator open: true
]

{ #category : #testing }
Open >> isOpen [

	^ true
]
