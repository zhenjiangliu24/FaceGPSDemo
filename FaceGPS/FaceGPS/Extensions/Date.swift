//
//  Date.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation

extension Date {
    /// Get epoch seconds
    var epoch: Int {
        return Int(timeIntervalSince1970)
    }
}
