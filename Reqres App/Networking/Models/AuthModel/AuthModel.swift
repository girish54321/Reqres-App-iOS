//
//  AuthModel.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import Foundation

struct LoginSuccessRoot: Decodable {
    let token: String
}

struct LoginErrorRoot: Decodable {
    let error: String
}
