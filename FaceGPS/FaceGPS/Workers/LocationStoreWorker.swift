//
//  LocationStoreWorker.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation

// MARK: Error enum
enum LocationStoreError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

func ==(lhs: LocationStoreError, rhs: LocationStoreError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
    case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
    case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
    default: return false
    }
}

enum LocationStoreResult<U>
{
    case Success(result: U)
    case Failure(error: LocationStoreError)
}

typealias createLocationCompleteHandler = (LocationStoreResult<Location>) -> Void
typealias fetchLocationCompleteHandler = (LocationStoreResult<Location>) -> Void
typealias fetchLocationsCompleteHandler = (LocationStoreResult<[Location]>) -> Void
typealias deleteLocationCompleteHandler = (LocationStoreResult<Location>) -> Void

protocol LocationStoreProtocol {
    func createLocation(locationToCreate: Location, complete: @escaping createLocationCompleteHandler)
    func fetchUnexportedLocations(complete: @escaping fetchLocationsCompleteHandler)
    func deleteLocation(complete: @escaping deleteLocationCompleteHandler)
}

// MARK: Location store worker
class LocationStoreWorker
{
    var store: LocationStoreProtocol
    
    init(store: LocationStoreProtocol) {
        self.store = store
    }
    
    func createLocation(locationToCreate: Location, complete: @escaping createLocationCompleteHandler)
    {
        store.createLocation(locationToCreate: locationToCreate, complete: complete)
    }
    
    func fetchUnexportedLocations(complete: @escaping fetchLocationsCompleteHandler)
    {
        store.fetchUnexportedLocations(complete: complete)
    }
    
    func deleteLocation(complete: @escaping deleteLocationCompleteHandler)
    {
        store.deleteLocation(complete: complete)
    }
}
