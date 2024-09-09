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
    var countryData: CountriesResponse
    
    var body: some View {
       
        GeometryReader { geo in
            
            VStack {
                
                ZStack {
                    KFImage.url(URL(string: countryData.flags?.png ?? .orNA))
                        .placeholder {
                            Image(IConstants.dummy)
                        }
                        .fromMemoryCacheOrRefresh()
                        .fade(duration: 0.10)
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height / 3)
                        .opacity(0.3)
                    
                    VStack {
                        KFImage.url(URL(string: countryData.flags?.png ?? .orNA))
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
                        Text(countryData.name?.official ?? .orNA)
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.accentColor)
                            .padding(.bottom, -50)
                    }
                }
                
                // Scrollable Country Info
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        createHStack(SConstants.flag, value: countryData.flag)
                        createHStack(SConstants.countryName, value: countryData.name?.common)
                        createHStack(SConstants.capitalCity, value: countryData.capital?.joined(separator: ", "))
                        createHStack("Continent Name", value: countryData.continents?.joined(separator: ", "))
                        createHStack("Time Zone", value: countryData.timezones?.joined(separator: ", "))
                        createHStack("Population", value: (countryData.population ?? 0).addCommaDelimiter())
                        createHStack("Currency Name", value: countryData.currencies?.first?.value.name)
                        createHStack(SConstants.currencySign, value: countryData.currencies?.first?.value.symbol)
                        createHStack("Start of Week", value: countryData.startOfWeek?.capitalized)
                        createHStack("Land borders", value: countryData.borders?.joined(separator: ", "))
                        createHStack("Land locked ?", value: countryData.landlocked?.description.capitalized)
                    }
                }
                .frame(height: geo.size.height * 2 / 3)
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
        
    }
    
    func createHStack(_ title: String, value: String?) -> some View {
        HStack(spacing: 10) {
            Text(title)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.accentColor)
            Spacer()
            Text(value ?? .orNA)
                .font(.system(size: 23, weight: .regular))
        }
    }
}

#Preview {
    CountryDetailView(countryData: .init())
}
