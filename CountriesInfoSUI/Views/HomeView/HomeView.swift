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
    @State private var selectedCountry: CountriesResponse? = nil
    @State private var isPresentingDetail = false
    @State private var showAlert = false
    @State private var signout = false
    
    // MARK: Main View
    var body: some View {
        
        NavigationView {
            
            ZStack {
                EmptyView()
                
                
                
                VStack {
                    // Search View
                    SearchBar
                        .frame(maxWidth: .infinity)
                        .clipped()
                    // List View
                    List(homeVM.fetchedCountyLists ?? .init(), id: \.name?.common) { country in
                        CountriesListCell(countryData: country)
                            .contentShape(Rectangle()) // Make the entire row tappable
                            .onTapGesture {
                                selectedCountry = country // Set the selected user and toggle presentation
                                isPresentingDetail = true
                            }
                    }
                    .sheet(item: $selectedCountry) { country in
                        CountryDetailView(countryData: country) // Present UserDetailView modally
                    }
                }
                
                NavigationLink(destination: SigninView(), isActive: $signout) {
                    EmptyView()
                }
                
            }
            .navigationTitle(SConstants.favCountriesList)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        showAlert = true
                    }
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Are you sure \(dataManager.userProfile?.name ?? "")?"),
                              message: Text((dataManager.userProfile?.name ?? "") + (dataManager.userProfile?.email ?? "")),
                              primaryButton: .cancel(),
                              secondaryButton: .default(Text("Yes"), action: {
                            // Trigger navigation to the sign-in view
                            dataManager.signOut()
                            signout = true
                        }))
                    })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
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
        .frame(height: 50)
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
