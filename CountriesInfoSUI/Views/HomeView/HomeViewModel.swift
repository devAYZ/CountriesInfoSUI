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
    @Published var showAlert = false
    @Published var showAlertTitle = SConstants.error
    @Published var showAlertMessage = ""
    
    @Published var fetchedCountyLists: CountriesResponseList = .init()
    
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
            fetchedCountyLists = dataManager.allCountries ?? .init()
            return
        }
        
        networkClass?.makeNetworkCall_Native(urlString: .users) { (response: Result<[GithubUsers], NetworkError>) in
            switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dataManager.allCountries = data
                        .sorted(by: { $0.login?.lowercased() ?? "" < $1.login?.lowercased() ?? "" })
                    self.fetchedCountyLists = self.dataManager.allCountries ?? .init()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    self.showAlertMessage = error.localizedDescription
                    self.showAlert = true
                }
            }
        }
    }
}
