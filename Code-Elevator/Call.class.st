Class {
	#name : #Call,
	#superclass : #Object,
	#instVars : [
		'floor',
		'direction'
	],
	#category : #'Code-Elevator'
}

{ #category : #accessing }
Call >> direction [

	^ direction
]

{ #category : #accessing }
Call >> direction: anObject [

	direction := anObject
]

{ #category : #accessing }
Call >> floor [

	^ floor
]

{ #category : #accessing }
Call >> floor: anObject [

	floor := anObject
]
