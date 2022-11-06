//
//  ProfileViewModel.swift
//  SeSAC2Week18
//
//  Created by J on 2022/11/03.
//

import Foundation

import RxSwift
import RxCocoa

class ProfileViewModel {
    let profile = PublishSubject<Profile>()
    
    func getProfile() {
        let api = SeSACAPI.profile
        
        Network.shard.requestSaSAC(type: Profile.self, url: api.url, method: .get, headers: api.header) { [weak self] response in
            switch response {
            case .success(let success):
                self?.profile.onNext(success)
            case .failure(let failure):
                self?.profile.onError(failure)
            }
        }
    }
}
