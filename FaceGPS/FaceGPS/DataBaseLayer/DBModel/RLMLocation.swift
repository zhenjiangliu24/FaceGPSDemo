//
//  RLMLocation.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RLMLocation: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var latitude: Double = 0
    @objc dynamic var longitude: Double = 0
    @objc dynamic var altitude: Double = 0
    @objc dynamic var floor: Int = 0
    @objc dynamic var horizontalAccuracy: Double = 0
    @objc dynamic var verticalAccuracy: Double = 0
    @objc dynamic var speed: Double = 0
    @objc dynamic var course: Double = 0
    @objc dynamic var timestamp = Date()
    @objc dynamic var exported: Bool = false
}

// DBLayer to App Layer model
extension RLMLocation {
    func toLocation() -> Location
    {
        let coordinate = Coordinate(latitude: latitude, longitude: longitude)
        
        let location = Location(id: id,
                                coordinate: coordinate,
                                altitude: altitude,
                                floor: floor,
                                horizontalAccuracy: horizontalAccuracy,
                                verticalAccuracy: verticalAccuracy,
                                speed: speed,
                                course: course,
                                timestamp: timestamp,
                                exported: exported)
        return location
    }
    
    func from(location: Location)
    {
        id = location.id
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
        altitude = location.altitude
        floor = location.floor
        horizontalAccuracy = location.horizontalAccuracy
        verticalAccuracy = location.verticalAccuracy
        speed = location.speed
        course = location.course
        timestamp = location.timestamp
        exported = location.exported
    }
}
