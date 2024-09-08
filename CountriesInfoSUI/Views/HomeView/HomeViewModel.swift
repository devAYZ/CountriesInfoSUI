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
    
    @Published var fetchedCountyLists: CountriesResponseList?
    
    // MARK: Initialiser
    init(
        networkClass: NetworkClassProtocol = NetworkClass()
    ) {
        self.networkClass = networkClass
    }
    
    func fetchCountryList() {
        
        var isDataCached: Bool {
            dataManager.allCountries != nil
        }
        
        guard !isDataCached else {
            fetchedCountyLists = dataManager.allCountries
            return
        }
        
        networkClass?.makeNetworkCall_Native(urlString: .allCountries, completion: { (response: Result<CountriesResponseList, NetworkError>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let data):
                    self.dataManager.allCountries = data
                        .filter { $0.currencies != nil }
                        .sorted(by: { $0.name?.common ?? "" < $1.name?.common ?? "" })
                    self.fetchedCountyLists = self.dataManager.allCountries
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
}
