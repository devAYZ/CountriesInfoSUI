//
//  SigninView.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import SwiftUI
import GoogleSignIn

struct SigninView: View {
    var body: some View {
        ZStack {
            Image("Sweden-transparent")
                .aspectRatio(contentMode: .fill)
                .opacity(0.1)
            VStack {
                Button("Ayo") {
                    print("yess")
                }
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                Text("Sign in to search and display details of your favourite country")
                    .font(.title2)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
        }
        .navigationBarHidden(true)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
