//
//  API.swift
//  UserList
//
//  Created by Adrian Kaleta on 28/11/2020.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case noData
    case urlError
    case error(Error)
    case parsing(Error?)
}

protocol APIProtocol:class {
    var session: URLSession { get }
    var url: URL { get }
    func downloadImage(url: String, completionHandler: @escaping (Result<UIImage, NetworkError>) -> Void)->URLSessionDataTask?
    func getObject<T: Codable>(parameters:[String:Any]?,
                               path: String,
                               completionHandler: @escaping (Result<T, NetworkError>) -> Void)
    func getObjects<T: Codable>(parameters:[String:Any]?,
                                path: String,
                                completionHandler: @escaping (Result<[T], NetworkError>) -> Void)
}

extension APIProtocol {
    func getObject<T: Codable>(parameters:[String:Any]?,
                               path: String,
                               completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        let baseUrl = url.appendingPathComponent(path)
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters?.compactMap({ (key,value) -> URLQueryItem in
            return URLQueryItem(name: key, value: "\(value)")
        })
        guard let url = components?.url else {
            completionHandler(.failure(.noData))
            return
        }
        let task = session.dataTask(with:url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(.failure(.error(error!)))
                    return
                }
                guard let data = data else {
                    completionHandler(.failure(.noData))
                    return
                }
                do {
                    let parsedData = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(parsedData))
                } catch let error {
                    completionHandler(.failure(.parsing(error)))
                }
            }
        }
        task.resume()
    }
    
    func getObjects<T: Codable>(parameters:[String:Any]?,
                                path: String,
                                completionHandler: @escaping (Result<[T], NetworkError>) -> Void) {
        let baseUrl = self.url.appendingPathComponent(path)
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)
        
        components?.queryItems = parameters?.compactMap({ (key,value) -> URLQueryItem in
            return URLQueryItem(name: key, value: "\(value)")
        })
        guard let url = components?.url else {
            completionHandler(.failure(.noData))
            return
        }
        
        let task = session.dataTask(with:url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(.failure(.error(error!)))
                    return
                }
                guard let data = data else {
                    completionHandler(.failure(.noData))
                    return
                }
                do {
                    let parsedData = try JSONDecoder().decode([T].self, from: data)
                    completionHandler(.success(parsedData))
                } catch let error {
                    completionHandler(.failure(.parsing(error)))
                }
            }
        }
        task.resume()
    }
    
    func downloadImage(url: String, completionHandler: @escaping (Result<UIImage, NetworkError>) -> Void)->URLSessionDataTask? {
        guard let url = URL(string: url) else {
            completionHandler(.failure(.urlError))
            return nil
        }
        let task = session.dataTask(with:url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(.failure(.error(error!)))
                    return
                }
                guard let data = data else {
                    completionHandler(.failure(.noData))
                    return
                }
                guard let image = UIImage(data:data) else {
                    completionHandler(.failure(.parsing(nil)))
                    return
                }
                completionHandler(.success(image))
            }
        }
        task.resume()
        return task
    }
}
