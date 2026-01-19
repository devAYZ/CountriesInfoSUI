//
//  AppStorageManager.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Fatokimi on 19/01/2026.
//

import Foundation
import SwiftUI

class AppStorageManager: CacheManagerProtocol {
    static let shared: AppStorageManager = {
        AppStorageManager()
    }()

    // MARK: AppStorage Backing
    @AppStorage(CacheKey.userProfile.rawValue) private var userProfileData: Data = Data()
    @AppStorage(CacheKey.allCountries.rawValue) private var allCountriesData: Data = Data()

    private init() {}

    // MARK: - Helpers
    private func getData(for key: CacheKey) -> Data {
        switch key {
        case .userProfile:
            return userProfileData
        case .allCountries:
            return allCountriesData
        }
    }

    private func setData(_ data: Data, for key: CacheKey) {
        switch key {
        case .userProfile:
            userProfileData = data
        case .allCountries:
            allCountriesData = data
        }
    }

    // MARK: - Cache - Objects
    func cacheObject<T: Encodable>(object: T, key: CacheKey) {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(object)
            setData(data, for: key)
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }

    func retrieveCachedObject<T: Decodable>(object: T.Type, key: CacheKey) -> T? {
        let data = getData(for: key)
        guard !data.isEmpty else { return nil }

        let jsonDecoder = JSONDecoder()
        do {
            let object = try jsonDecoder.decode(T.self, from: data)
            return object
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }

    func removeObject(key: CacheKey) {
        setData(Data(), for: key)
    }
}
