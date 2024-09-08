//
//  AppDelegate.swift
//  CountriesInfoSUI
//
//  Created by Ayokunle Pro on 9/7/24.
//

import SwiftUI
import Foundation

class AppDelegate: NSObject, UIApplicationDelegate {
         
    private var orientationLock = UIInterfaceOrientationMask.portrait // By default you want all your views to rotate freely
 
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        application.isIdleTimerDisabled = true
        Thread.sleep(forTimeInterval: 1.8) // Set sleep wait interval
        return true
    }
}
