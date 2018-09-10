//
//  DBWorker.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        let array = Array(self) as! [T]
        return array
    }
}

class DBWorker: LocationStoreProtocol {
    
    init() {
        config()
    }
    
    func config()
    {
        var config = Realm.Configuration()
        
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("locations.realm")
        
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }
    
    func createLocation(locationToCreate: Location, complete: @escaping createLocationCompleteHandler) {
        let rlmLocation = RLMLocation()
        rlmLocation.from(location: locationToCreate)
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(rlmLocation)
            }
            complete(.Success(result: locationToCreate))
        } catch let error {
            complete(.Failure(error: .CannotCreate("Create location failed: \(error.localizedDescription)")))
        }
    }
    
    func fetchUnexportedLocations(complete: @escaping fetchLocationsCompleteHandler) {
        do {
            let realm = try Realm()
            
            let locations = realm.objects(RLMLocation.self)
                .filter("exported == false").toArray(ofType: RLMLocation.self)
                .map { $0.toLocation() }
            
            complete(.Success(result: locations))
        } catch let error {
            complete(.Failure(error: .CannotFetch("Fetch locations failed: \(error.localizedDescription)")))
        }
    }
    
    // delete exported locations
    func deleteExportedLocation(complete: @escaping deleteLocationsCompleteHandler) {
        do {
            let realm = try Realm()
            
            let rlmlocations = realm.objects(RLMLocation.self).filter("exported == true")
            let locations = rlmlocations.toArray(ofType: RLMLocation.self).map { $0.toLocation() }
            try realm.write {
                realm.delete(rlmlocations)
            }
            
            complete(.Success(result: locations))
        } catch let error {
            complete(.Failure(error: .CannotDelete("Delete locations failed: \(error.localizedDescription)")))
        }
    }
    
    func detectAllLocations(complete: @escaping deleteLocationsCompleteHandler) {
        do {
            let realm = try Realm()
            
            let rlmlocations = realm.objects(RLMLocation.self)
            let locations = rlmlocations.toArray(ofType: RLMLocation.self).map { $0.toLocation() }
            try realm.write {
                realm.delete(rlmlocations)
            }
            
            complete(.Success(result: locations))
        } catch let error {
            complete(.Failure(error: .CannotDelete("Delete locations failed: \(error.localizedDescription)")))
        }
    }

}


