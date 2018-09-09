//
//  Notificationable.swift
//  FaceGPS
//
//  Created by Zhenjiang Liu on 2018-09-09.
//  Copyright © 2018 zhenjiang. All rights reserved.
//

import Foundation

enum AppNotification: String {
    case detectFace
    
    var notificationName: Notification.Name {
        return Notification.Name(self.rawValue)
    }
}

protocol Notificationable { }

extension Notificationable {
    func postNotification(name: AppNotification, object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: name.notificationName, object: object, userInfo: userInfo)
    }
}
