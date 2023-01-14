//
//  Person.swift
//  TryingMVP
//
//  Created by Григорий Данилюк on 13.01.2023.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
