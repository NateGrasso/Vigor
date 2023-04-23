//
//  ContentView.swift
//  Vigor
//
//  Created by Nathan Grasso on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var showingLoginScreen = false
    
    var body: some View {
       AuthView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
