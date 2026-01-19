//
//  NavigatorDirector.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/8/24.
//

import SwiftUI

enum Destination: CaseIterable {
    case imageView
    case home
    case signin
}

struct NavigatorDirector: View, DataManagerInjector {
    
    // MARK: Properties
    @State private var scale: CGFloat = 1.0
    @State private var navigateToSignIn = false
    @State private var navigateToHome = false
    @State private var hideFaintBg = false
    
    @State private var showImageView = false
    @State private var destination: Destination = .imageView

    
    // MARK: Main View
    var body: some View {
        
        Group {
            switch destination {
            case .imageView:
                imageStackView
            case .home:
                NavigationView {
                    HomeView(destination: $destination)
                }
            case .signin:
                SigninView(destination: $destination)
            }
        }
        .onAppear {
            // Navigate or handle further actions
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                openNavigation()
            }
        }
    }
    
    var imageStackView: some View {
        ZStack {
            Image(IConstants.worldMap)
                .aspectRatio(contentMode: .fill)
                .opacity(hideFaintBg ? 0 : 0.1)
            backgroundImageView
        }
    }
    
    var backgroundImageView: some View {
        Image(IConstants.swedenTransparent)
            .aspectRatio(contentMode: .fill)
            .opacity(0.3)
            .scaleEffect(scale)
            .onAppear {
                // First animation (shrink)
                withAnimation(.easeInOut(duration: 0.6)) {
                    scale = 0.5
                }
                // Second animation (grow)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        hideFaintBg = true
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
        isUserLoggedIn ? (destination = .home) : (destination = .signin)
    }
}

struct NavigatorDirector_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorDirector()
    }
}
