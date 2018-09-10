//
//  CLLocation.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocation {
    func toLocation() -> Location
    {
        let epoch = self.timestamp.epoch
        let coord = Coordinate(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        let location = Location(id: epoch,
                                coordinate: coord,
                                altitude: altitude,
                                floor: floor?.level ?? 0,
                                horizontalAccuracy: horizontalAccuracy,
                                verticalAccuracy: verticalAccuracy,
                                speed: speed,
                                course: course,
                                timestamp: timestamp,
                                exported: false)
        
        return location
    }
}
