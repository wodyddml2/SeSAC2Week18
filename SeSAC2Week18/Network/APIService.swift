//
//  APIService.swift
//  SeSAC2Week18
//
//  Created by J on 2022/11/02.
//

import Foundation

import Alamofire

struct Login: Codable {
    let token: String
}

struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

class APIService {
    func signup() {
        let api = SeSACAPI.signup(userName: "JY", email: "ww@naver.com", password: "12345678")
      
        AF.request(api.url, method: .post, parameters: api.parameter, headers: api.header).responseString { response in
            print(response)
            print(response.response!.statusCode)
        }
    }
    
    func login() {
        let api = SeSACAPI.login(email: "ww@naver.com", password: "12345678")
    
        AF.request(api.url, method: .post, parameters: api.parameter, headers: api.header)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Login.self) { response in
                
            switch response.result {
            case .success(let value):
                print(value.token)
                UserDefaults.standard.set(value.token, forKey: "token")
            case .failure(_):
                print(response.response!.statusCode)
            }
        }
    }
    
    func profile() {
        let api = SeSACAPI.profile
        AF.request(api.url, method: .get, headers: api.header)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Profile.self) { response in
                
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(_):
                print(response.response!.statusCode)
            }
        }
    }
}
