//
//  HomeViewModel.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Fatokimi  on 08/09/2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    static let shared = HomeViewModel()
    
    @Published var tempCountry: CountriesResponseList = [
        CountriesResponse(
            name: .init(common: "Sweden", official: "Kingdom of Sweden"),
            currencies: ["SEK" : .init(name: "Krona", symbol: "kr")],
            capital: ["Stockholm"],
            population: 10_000_000,
            timezones: ["UTC+01:00"],
            continents: ["Europe"],
            flags: .init(png: "https://picsum.photos/200", svg: nil, alt: nil),
            startOfWeek: "Monday"
        ),
        CountriesResponse(
            name: .init(common: "Nigeria", official: "Federal Republic of Nigeria"),
            currencies: ["NGN" : .init(name: "Nigerian naira", symbol: "₦")],
            capital: ["Abuja"],
            population: 206_000_000,
            timezones: ["UTC+01:00"],
            continents: ["Africa"],
            flags: .init(png: "https://picsum.photos/200", svg: nil, alt: nil),
            startOfWeek: "Monday"
        ),
        CountriesResponse(
            name: .init(common: "Artic Region", official: "Artic Region"),
            currencies: nil,
            capital: ["Artic Capital"],
            population: 1_000,
            timezones: ["UTC+020:00"],
            continents: ["Pacific"],
            flags: .init(png: nil, svg: nil, alt: nil),
            startOfWeek: "Zesday"
        )
    ]
}
