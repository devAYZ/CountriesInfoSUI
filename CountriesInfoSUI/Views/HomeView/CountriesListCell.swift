//
//  CountriesListCell.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Fatokimi  on 08/09/2024.
//

import Kingfisher
import SwiftUI

// MARK: Countries List Cell
struct CountriesListCell: View {
    
    var countryData: CountriesResponse
    
    var body: some View {
        HStack(alignment: .center) {
            // Flag
            KFImage.url(URL(string: countryData.flags?.png ?? .orNA))
                .placeholder {
                    Image(IConstants.dummy)
                }
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.15)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .padding(.trailing, 8)
            
            // Country Names
            VStack(alignment: .leading, spacing: 3) {
                Text(countryData.name?.common ?? .orNA)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .font(.system(size: 24, weight: .regular))
                Text(countryData.capital?.first ?? .orNA)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .font(.system(size: 18, weight: .medium))
            }
            
            Spacer()
            
            // Currency
            Text(countryData.currencies?.first?.value.symbol ?? .orNA)
                .lineLimit(1)
                .foregroundColor(.green)
                .font(.system(size: 18, weight: .medium))
        }
    }
}

#Preview {
    CountriesListCell(countryData: .init())
}
