//
//  HomeView.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import Kingfisher
import SwiftUI

struct HomeView: View {
    
    // MARK: Properties
    @ObservedObject var homeVM = HomeViewModel.shared
    @State private var selectedCountry: CountriesResponse? = nil
    @State private var isPresentingDetail = false
    
    // MARK: Main View
    var body: some View {
        ZStack {
            EmptyView()
            VStack {
                // Search View
                SearchBar
                    .frame(maxWidth: .infinity)
                    .clipped()
                // List View
                List(homeVM.tempCountry ?? .init(), id: \.id) { country in
                    CountriesListCell(countryData: country)
                        .onTapGesture {
                            selectedCountry = country // Set the selected user and toggle presentation
                            isPresentingDetail = true
                        }
                }
                .sheet(item: $selectedCountry) { country in
                    CountryDetailView(countryData: country) // Present UserDetailView modally
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(SConstants.favCountriesList)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            homeVM.fetchCountryList()
        }
    }
    
    var SearchBar: some View {
        HStack {
            Image(IConstants.search)
            if #available(iOS 15.0, *) {
                TextField(SConstants.searchHint, text: $homeVM.searchText)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .onSubmit {
                        handleSearchButtonClicked()
                    }
            } else {
                // Fallback on earlier versions
                TextField(SConstants.searchHint, text: $homeVM.searchText)
            }
        }
        .font(.system(size: 17, weight: .regular))
        .padding(.horizontal, 16)
        .frame(height: 40)
    }
    
    
    func handleSearchButtonClicked() {
    }
    
    private func refresh() async {
        try? await Task.sleep(nanoseconds: 1_000_000)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
