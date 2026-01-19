//
//  DataManager.swift
//  Countries Info
//
//  Created by Ayokunle Fatokimi on 22/08/2024.
//

import Foundation
import GoogleSignIn

protocol DataManagerInjector {
    var dataManager: DataManager { get }
}

extension DataManagerInjector {
    var dataManager: DataManager {
        return DataManager.shared
    }
}

final class DataManager {
    
    // MARK: Init
    init() {
    }
    
    // MARK: Properties (User default)
    fileprivate static let shared = DataManager()
    
    var allCountries: CountriesResponseList? {
        get {
            return FileManagerCache.shared.retrieveCachedObject(object: CountriesResponseList.self, key: .allCountries)
        }
        set(value){
            FileManagerCache.shared.cacheObject(object: value, key: .allCountries)
        }
    }
    
    var allUsers: GithubUsersList?
    
    var userProfile: UserProfile? {
        get {
            return AppStorageManager.shared.retrieveCachedObject(object: UserProfile.self, key: .userProfile)
        }
        set(value){
            AppStorageManager.shared.cacheObject(object: value, key: .userProfile)
        }
    }
    
    var appVersion: String {
        "v\(InfoDicManager.getStringValue(key: .appVersion))(\(InfoDicManager.getStringValue(key: .appVersionBuild)))"
    }
    
    func signOut() {
        AppStorageManager.shared.removeObject(key: .userProfile)
        GIDSignIn.sharedInstance.signOut()
    }
}
