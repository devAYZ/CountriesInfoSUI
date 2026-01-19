//
//  CacheManager.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Fatokimi on 19/01/2026.
//

import Foundation

protocol CacheManagerProtocol {
    associatedtype T
    static var shared: T { get }
    func cacheObject<T: Encodable>(object: T, key: CacheKey)
    func retrieveCachedObject<T: Decodable>(object: T.Type, key: CacheKey) -> T?
    func removeObject(key: CacheKey)
}

enum CacheKey: String {
    case userProfile
    case allCountries
}
