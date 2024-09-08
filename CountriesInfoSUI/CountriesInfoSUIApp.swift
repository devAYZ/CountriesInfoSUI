//
//  CountriesInfoSUIApp.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/7/24.
//

import GoogleSignIn
import SwiftUI

@main
struct CountriesInfoSUIApp: App, DataManagerInjector {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {}
    
    var body: some Scene {
        WindowGroup {
            NavigatorDirector()
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        // Check if `user` exists; otherwise, do something with `error`
                        if error != nil || user == nil {
                            // Show the app's signed-out state.
                        } else {
                            // Show the app's signed-in state.
                            self.dataManager.userProfile = .init(
                                name: user?.profile?.name,
                                email: user?.profile?.email,
                                imageURL: user?.profile?.imageURL(withDimension: .image200)
                            )
                        }
                    }
                }
        }
    }
}
