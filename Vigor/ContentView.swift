//
//  ContentView.swift
//  Vigor
//
//  Created by Nathan Grasso on 4/9/23.
//

import SwiftUI
import FirebaseAuth
struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var showingLoginScreen = false
    
    @AppStorage("uid") var userID: String = ""

    var body: some View {
        if userID == ""{
            AuthView()
        }else{
            Text("Logged in as \(userID)")
            Button(action : {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    withAnimation{
                        userID = ""
                    }
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }) {
                Text ("Sign Out")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
