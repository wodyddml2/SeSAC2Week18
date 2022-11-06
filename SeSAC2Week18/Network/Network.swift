//
//  Network.swift
//  SeSAC2Week18
//
//  Created by J on 2022/11/03.
//

import Foundation
import Alamofire

final class Network {
    static let shard = Network()
    
    private init() { }
    
    func requestSaSAC<T: Decodable>(type: T.Type = T.self, url: URL, method: HTTPMethod, parameter: [String: String]? = nil, headers: HTTPHeaders, completionHandler: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, method: method, parameters: parameter, headers: headers)
            .responseDecodable(of: T.self) { response in
                
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                    
                case .failure(_):
                    guard let statusCode = response.response?.statusCode else {return}
                    guard let error = SeSACError(rawValue: statusCode) else {return}
                    completionHandler(.failure(error))
                }
            }
    }
}
