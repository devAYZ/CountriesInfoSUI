//
//  UserProfileModels.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import Foundation

class UserProfile: Codable {
    var name: String?
    var email: String?
    var imageURL: URL?
    
    init(name: String? = nil, email: String? = nil, imageURL: URL? = nil) {
        self.name = name
        self.email = email
        self.imageURL = imageURL
    }
}
