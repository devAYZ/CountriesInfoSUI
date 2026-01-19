//
//  CountryDetailView.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Fatokimi  on 08/09/2024.
//

import Kingfisher
import SwiftUI

struct CountryDetailView: View {
    
    // MARK: Properties
    var countryData: GithubUsers
    
    var body: some View {
       
        GeometryReader { geo in
            
            VStack {
                
                ZStack {
                    KFImage.url(URL(string: countryData.avatarURL ?? .orNA))
                        .placeholder {
                            Image(IConstants.dummy)
                        }
                        .fromMemoryCacheOrRefresh()
                        .fade(duration: 0.10)
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height / 3)
                        .opacity(0.3)
                    
                    VStack {
                        KFImage.url(URL(string: countryData.avatarURL ?? .orNA))
                            .placeholder {
                                Image(IConstants.dummy)
                            }
                            .fromMemoryCacheOrRefresh()
                            .fade(duration: 0.10)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160, height: 130)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.green, lineWidth: 10)
                                    .cornerRadius(15)
                            )
                        Text(countryData.login ?? .orNA)
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.accentColor)
                            .padding(.bottom, -50)
                            .multilineTextAlignment(.center)
                    }
                }
                
                // Scrollable Country Info
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        createHStack("Avatar", value: countryData.avatarURL)
                        createHStack("ID", value: "\(countryData.id ?? .zero)")
                        createHStack("URL", value: countryData.url)
                        createHStack("Followers URL", value: countryData.followersURL)
                        createHStack("Repos URL", value: countryData.reposURL)
                        createHStack("Type", value: countryData.type)
                        createHStack("User View Type", value: countryData.userViewType)
                        
                        createHStack("Site Admin ?", value: countryData.siteAdmin?.description.capitalized)
                    }
                }
                .frame(height: geo.size.height * 2 / 3)
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
        .padding(.bottom, 40)
        
    }
    
    func createHStack(_ title: String, value: String?) -> some View {
        HStack(spacing: 5) {
            Text(title)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.accentColor)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
            
            Text(value ?? .orNA)
                .font(.system(size: 23, weight: .regular))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
        }
    }
}
/*
#Preview {
    CountryDetailView(countryData: .init())
}
*/
