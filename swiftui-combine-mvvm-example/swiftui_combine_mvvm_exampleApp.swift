//
//  swiftui_combine_mvvm_exampleApp.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI
import UIKit

@main
struct swiftui_combine_mvvm_exampleApp: App {
    
    // SwiftUIではAppDelegateがない。PUSHなど使うためには以下のように定義が必要
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - AppDelegte
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        debugPrint("application:didFinishLaunchingWithOptions:")
        application.registerForRemoteNotifications()

        return true
        
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        debugPrint(deviceToken.base64EncodedString())
        
    }
}
