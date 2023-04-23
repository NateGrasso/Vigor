//
//  VigorApp.swift
//  Vigor
//
//  Created by Nathan Grasso on 4/9/23.
//

import SwiftUI
import FirebaseCore
@main
struct VigorApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
