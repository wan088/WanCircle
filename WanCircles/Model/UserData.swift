//
//  UserData.swift
//  WanCircles
//
//  Created by Yongwan on 08/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import Foundation
class UserData{
    static let current = UserData()
    private init() {}
    var Email: String?
    var Name: String?
    var Belong: String?
    var Univ: String?
    var Authority: String?
}
