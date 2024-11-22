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
    
    // MARK: Properties
    @State private var navigateToHome = false
    @State private var showAlert = false
    @State private var showAlertTitle = SConstants.error
    @State private var showAlertMessage = SConstants.dataNA
    @State private var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    
    // MARK: Main View
    var body: some View {
        NavigationView {
            ZStack {
                Image(IConstants.swedenTransparent)
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
                    // Google sign-in button
                    GoogleSignInButton(style: .wide, action: signInButton)
                        .frame(width: 120)
                        .padding(.top, 25)
                    // NavigationLink
                    NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                        EmptyView()
                    }
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(showAlertTitle), message: Text(showAlertMessage))
        })
    }
    
    private func signInButton() {
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "Google_Signin") {[self] in
            // This is the expiration handler.
            // It is called if the background time is about to expire.
            self.endBackgroundTask()
        }
        
        // Google Signin
        handleSignInButton()
        
        endBackgroundTask()
    }
    
    func handleSignInButton() {
        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootController) { signInResult, error in
            guard error == nil else {
                showAlertMessage = error?.localizedDescription ?? ""
                showAlert = true
                return
            }
            
            // If sign in succeeded, display the app's main content View.
            guard let result = signInResult else {
                showAlertMessage = SConstants.dataNA
                showAlert = true
                return
            }
            self.dataManager.userProfile = .init(
                name: result.user.profile?.name,
                email: result.user.profile?.email,
                imageURL: result.user.profile?.imageURL(withDimension: .image200)
            )
            
            // Trigger naviagate to home
            navigateToHome = true
        }
    }
    
    private func endBackgroundTask() {
        if backgroundTask != .invalid {
            UIApplication.shared.endBackgroundTask(backgroundTask)
            backgroundTask = .invalid
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
