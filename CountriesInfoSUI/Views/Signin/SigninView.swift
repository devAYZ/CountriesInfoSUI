//
//  SigninView.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

struct SigninView: View, DataManagerInjector {
    var body: some View {
        ZStack {
            Image("Sweden-transparent")
                .aspectRatio(contentMode: .fill)
                .opacity(0.1)
            VStack(spacing: 15) {
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text("Sign in to search and display details of your favourite country")
                    .font(.title2)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                GoogleSignInButton(style: .wide, action: handleSignInButton)
                    .padding(.top, 30)
                    .padding(.horizontal, 50)
            }
            .padding()
            
        }
        .navigationBarHidden(true)
    }
    
    func handleSignInButton() {
        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootController) { signInResult, error in
            guard error == nil else {
                Alert(title: Text("Error"), message: Text(error?.localizedDescription ?? ""))
                print(error?.localizedDescription)
                return
            }
            
            // If sign in succeeded, display the app's main content View.
            guard let result = signInResult else {
                Alert(title: Text("Error"), message: Text("Data Not Found"))
                print("Data Not Found")
                return
            }
            self.dataManager.userProfile = .init(
                name: result.user.profile?.name,
                email: result.user.profile?.email,
                imageURL: result.user.profile?.imageURL(withDimension: .image200)
            )
            // TODO: naviagate home
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
