//
//  AuthAPIController.swift
//  Reqres App
//
//  Created by Girish Parate on 21/08/21.
//

import Foundation
struct AuthAPIController {
   
//    func loginUser(params: JSON) -> Resource<UserResponseRoot, CustomError> {
//        let data = Resource<UserResponseRoot, CustomError>(jsonDecoder: JSONDecoder(), path: "/register",
//            params: params)
//        return data
//    }
    
    func loginUser(params: JSON) -> Resource<UserResponseRoot, CustomError> {
        let data = Resource<UserResponseRoot, CustomError>(jsonDecoder: JSONDecoder(), path: "/register",
                                                           method: RequestMethod.get)
        return data
    }
    
}
