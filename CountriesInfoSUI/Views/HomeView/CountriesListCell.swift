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
    
    // MARK: Properties
    var countryData: GithubUsers
    
    // MARK: Main View
    var body: some View {
        HStack(alignment: .center) {
            // Flag
            KFImage.url(URL(string: countryData.avatarURL ?? .orNA))
                .placeholder {
                    Image(IConstants.dummy)
                }
                .loadDiskFileSynchronously()
                .fromMemoryCacheOrRefresh()
                .fade(duration: 0.10)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .padding(.trailing, 8)
            
            // Country Names
            VStack(alignment: .leading, spacing: 3) {
                Text(countryData.login ?? .orNA)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .font(.system(size: 18, weight: .regular))
                Text(countryData.url ?? .orNA)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .font(.system(size: 12, weight: .medium))
            }
            
            Spacer()
            
            // Currency
            Text("\(countryData.id ?? .zero)")
                .lineLimit(1)
                .foregroundColor(.green)
                .font(.system(size: 18, weight: .medium))
        }
    }
}
/*
 #Preview {
 CountriesListCell(countryData: .init())
 }
 */
