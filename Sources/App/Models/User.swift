//
//  User.swift
//
//
//  Created by Edgar Guitian Rey on 5/2/24.
//

import Foundation
import Vapor

struct User: Content {
    var id: Int
    var name: String
    var age: Int
    var email: String
}
