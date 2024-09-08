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
        VStack {
            ZStack {
                KFImage.url(URL(string: countryData.flags?.png ?? .orNA))
                    .placeholder {
                        Image(IConstants.dummy)
                    }
                    .fromMemoryCacheOrRefresh()
                    .fade(duration: 0.10)
                    .frame( maxWidth: .infinity)
                    .opacity(0.3)
            }
            .frame(alignment: .center)
            .frame( maxWidth: .infinity)
            Text(countryData.name?.common ?? .orNA)
            
            Spacer()
        }
        
    }
}

#Preview {
    CountryDetailView(countryData: .init())
}
