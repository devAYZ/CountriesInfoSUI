//
//  NavigatorDirector.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import SwiftUI

struct NavigatorDirector: View, DataManagerInjector {
    
    @State private var scale: CGFloat = 1.0
    @State private var navigateToSignIn = false
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationView {
            if navigateToHome {
                NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                    imageStackView
                }
            } else {
                NavigationLink(destination: SigninView(), isActive: $navigateToSignIn) {
                    imageStackView
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // Navigate or handle further actions
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                openNavigation()
            }
        }
    }
    
    var imageStackView: some View {
        ZStack {
            Image("world-map-big")
                .aspectRatio(contentMode: .fill)
                .opacity(0.12)
            backgroundImageView
        }
    }
    
    var backgroundImageView: some View {
        Image("Sweden-transparent")
            .aspectRatio(contentMode: .fill)
            .opacity(0.35)
            .scaleEffect(scale)
            .onAppear {
                // First animation (shrink)
                withAnimation(.easeInOut(duration: 0.6)) {
                    scale = 0.5
                }
                // Second animation (grow)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        scale = 3.0
                    }
                }
            }
    }
    
    // Check and Navigate
    private func openNavigation() {
        var isUserLoggedIn: Bool {
            dataManager.userProfile != nil
        }
        isUserLoggedIn ? (navigateToHome = true) : (navigateToSignIn = true)
    }
}

struct NavigatorDirector_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorDirector()
    }
}
