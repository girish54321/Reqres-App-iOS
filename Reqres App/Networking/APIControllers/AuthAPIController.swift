//
//  AuthAPIController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import Foundation
struct AuthAPIController {
    func loginUser(params: JSON) -> Resource<LoginSuccessRoot, LoginErrorRoot> {
//        let data = Resource<LoginSuccessRoot, LoginErrorRoot>(
//            jsonDecoder: JSONDecoder(),
//            path: "/register",
//            method: RequestMethod.post,
//            parse:parse)
        
        let data = Resource<LoginSuccessRoot, LoginErrorRoot>(
            jsonDecoder: JSONDecoder(),
            path: "/register",
            method: RequestMethod.post,
            params: params)
        return data
    }
    
}
