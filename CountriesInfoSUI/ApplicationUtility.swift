//
//  ApplicationUtility.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Fatokimi  on 08/09/2024.
//

import UIKit
import SwiftUI


final class ApplicationUtility {
    static var rootController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { 
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
