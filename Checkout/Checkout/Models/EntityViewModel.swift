//
//  ViewModel.swift
//  Checkout
//
//  Created by Alan Morford on 4/19/23.
//

/**
  Basic capabilities for a ViewModel that is to be populated by an Entity from the REST Library
 */
protocol EntityViewModel {
    /**
        The Type of Entity from which the conforming ViewModel will populate its View Data
     */
    associatedtype Entity
    
    /**
        A Static function attempting to populate the View Data of this model from the Entity passed in.
     */
    static func fromEntity(entity: Entity) -> Self?
    
    /**
        A Static function always returned with Stub View Data
     */
    static func Empty() -> Self
}
