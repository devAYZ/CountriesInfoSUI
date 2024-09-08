//
//  HomeView.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import Kingfisher
import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    @ObservedObject var homeVM = HomeViewModel.shared
    
    // MARK: Main View
    var body: some View {
        ZStack {
            EmptyView()
            VStack {
                searchBar
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                List(homeVM.tempCountry, id: \.id) { country in
                    NavigationLink(destination: EmptyView()) {
                        CountriesListCell(countryData: country)
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(SConstants.favCountriesList)
        .navigationBarTitleDisplayMode(.large)
    }
    
    var searchBar: some View {
        HStack {
            Image(IConstants.search)
            if #available(iOS 15.0, *) {
                TextField(SConstants.searchHint, text: $searchText)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .onSubmit {
                        handleSearchButtonClicked()
                    }
            } else {
                // Fallback on earlier versions
                TextField(SConstants.searchHint, text: $searchText)
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
