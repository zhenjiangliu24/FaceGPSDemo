//
//  Location.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation

typealias LocationDegree = Double
typealias LocationDistance = Double
typealias LocationAccuracy = Double
typealias LocationSpeed = Double
typealias LocationDirection = Double

struct Coordinate: Equatable {
    var latitude: LocationDegree
    var longitude: LocationDegree
}

func ==(lhs: Coordinate, rhs: Coordinate) -> Bool
{
    return lhs.latitude == rhs.latitude
        && lhs.longitude == rhs.longitude
}

struct Location: Equatable {
    var id: Int
    var coordinate: Coordinate
    var altitude: LocationDistance
    var floor: Int
    var horizontalAccuracy: LocationAccuracy
    var verticalAccuracy: LocationAccuracy
    var speed: LocationSpeed
    var course: LocationDirection
    var timestamp: Date
    var exported: Bool   // indicate that the location is exported to cloud or not
}

func ==(lhs: Location, rhs: Location) -> Bool
{
    return lhs.id == rhs.id
        && lhs.coordinate == rhs.coordinate
        && lhs.altitude == rhs.altitude
        && lhs.floor == rhs.floor
        && lhs.horizontalAccuracy == rhs.horizontalAccuracy
        && lhs.verticalAccuracy == rhs.verticalAccuracy
        && lhs.speed == rhs.speed
        && lhs.course == rhs.course
        && lhs.timestamp == rhs.timestamp
        && lhs.exported == rhs.exported
}
