//
//  Errors.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-08.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation

enum DataError: Error {
    case setupCaptureSessionError
    case unknownError(Error?)
}
