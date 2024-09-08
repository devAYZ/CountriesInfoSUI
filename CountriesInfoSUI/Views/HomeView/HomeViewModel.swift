//
//  HomeViewModel.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Fatokimi  on 08/09/2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject, DataManagerInjector {
    
    // MARK: Properties
    static let shared = HomeViewModel()
    @State var searchText = ""
    var networkClass: NetworkClassProtocol?
    
    @Published var tempCountry: CountriesResponseList? = [
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
            flags: .init(png: "https://picsum.photos/200", svg: nil, alt: nil),
            startOfWeek: "Zesday"
        )
    ]
    
    // MARK: Initialiser
    init(
        networkClass: NetworkClassProtocol = NetworkClass()
    ) {
        self.networkClass = networkClass
    }
    
    func fetchCountryList_temp() {
        print("yes")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tempCountry?.append(
                CountriesResponse(
                    name: .init(common: "Ayo", official: "Ayo Region"),
                    currencies: ["Ayo": .init(name: "Ayo", symbol: "A")],
                    capital: ["Artic Capital"],
                    population: 1_000,
                    timezones: ["UTC+020:00"],
                    continents: ["Pacific"],
                    flags: .init(png: "https://picsum.photos/200", svg: nil, alt: nil),
                    startOfWeek: "Sunday"
                )
            )
        }
        
//        showLoading?(true)
//        networkClass?.makeNetworkCall_AF(urlString: .allCountries) { [self] (response: FResponse<CountriesResponseList, FError>) in
//            showLoading?(false)
//            switch response.result {
//            case .success(let data):
//                view?.networkCallSuccess(data: data
//                    .filter { $0.currencies != nil }
//                    .sorted(by: { $0.name?.common ?? "" < $1.name?.common ?? "" })
//                )
//            case .failure(let error):
//                view?.networkCallFailed(error: error)
//            }
//        }
    }
    
    func fetchCountryList() {
//        networkClass?.makeNetworkCall_Native(urlString: .allCountries, completion: { (response: Result<CountriesResponseList, NetworkError>) in
//            DispatchQueue.main.async {
//                switch response {
//                case .success(let data):
//                    self.dataManager.allCountries = data
//                        .filter { $0.currencies != nil }
//                        .sorted(by: { $0.name?.common ?? "" < $1.name?.common ?? "" })
//                    self.tempCountry = self.dataManager.allCountries
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        })
    }
}
