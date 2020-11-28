//
//  GithubAPI.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import UIKit

class GithubAPI: APIProtocol {
    
    // MARK: - Internal properties
    
    static let shared: GithubAPI = GithubAPI()
    
    var session: URLSession {
        return URLSession.shared
    }
    
    var url: URL {
        return URL(string: "https://api.github.com")!
    }
    
    init(){  }
    
    func getUsers(completionHandler: @escaping (Result<[GithubUser], NetworkError>) -> Void) {
        getObjects(parameters:nil,
                                path: "/users",
                                completionHandler: completionHandler)
    }
    
    func getDetails(id: String, completionHandler: @escaping (Result<GithubUserDetails, NetworkError>) -> Void) {
        getObject(parameters:nil,
                                path: "/users/\(id)",
                                completionHandler: completionHandler)
    }
}
