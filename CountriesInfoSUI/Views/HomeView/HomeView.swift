//
//  HomeView.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import Kingfisher
import SwiftUI

struct HomeView: View, DataManagerInjector {
    
    // MARK: Properties
    @ObservedObject var homeVM = HomeViewModel.shared
    @State private var selectedCountry: GithubUsers? = nil
    @State private var isPresentingDetail = false
    @State private var showAlert = false
    
    @Binding var destination: Destination
    
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
                List(homeVM.fetchedCountyLists, id: \.id ) { country in
                    NavigationLink(
                        destination: CountryDetailView(countryData: country),
                        tag: country,
                        selection: $selectedCountry
                    ) {
                        CountriesListCell(countryData: country)
                    }
                }
            }
            
        }
        .navigationTitle("Favourite Countries List")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Sign out") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Are you sure \(dataManager.userProfile?.name ?? "")?"),
                          message: Text((dataManager.userProfile?.name ?? "") + (dataManager.userProfile?.email ?? "")),
                          primaryButton: .cancel(),
                          secondaryButton: .default(Text("Yes"), action: {
                        // Trigger navigation to the sign-in view
                        dataManager.signOut()
                        destination = .signin
                    }))
                })
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $homeVM.showAlert, content: {
            Alert(title: Text(homeVM.showAlertTitle), message: Text(homeVM.showAlertMessage))
        })
        .onAppear {
            homeVM.fetchCountryList()
        }
        
    }
    
    var SearchBar: some View {
        HStack {
            Image(IConstants.search)
            if #available(iOS 15.0, *) {
                TextField("Search by: Name, Capital, Currency", text: $homeVM.searchText)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .onSubmit {
                        handleSearchButtonClicked()
                    }
            } else {
                // Fallback on earlier versions
                TextField("Search by: Name, Capital, Currency", text: $homeVM.searchText)
            }
        }
        .font(.system(size: 17, weight: .regular))
        .padding(.horizontal, 16)
        .frame(height: 50)
    }
    
    
    func handleSearchButtonClicked() {
    }
    
    private func refresh() async {
        try? await Task.sleep(nanoseconds: 1_000_000)
    }
}

#Preview {
    HomeView(destination: .constant(.home))
}
