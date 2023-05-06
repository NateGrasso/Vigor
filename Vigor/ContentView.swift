//
//  ContentView.swift
//  Vigor
//
//  Created by Nathan Grasso on 4/9/23.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var showingLoginScreen = false
    
    @AppStorage("uid") var userID: String = ""
    @ObservedObject var model = ViewWorkouts()
    
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
        List (model.list) {item in
            HStack{
                Text("Date:")
                Text(item.Date)
            }
            HStack{
                Text("Exercise:")
                Text(item.Exercise)
            }
            HStack{
                Text("Set:")
                Text(item.Set)
            }
            HStack{
                Text("Reps:")
                Text(item.Reps)
            }
            HStack{
                Text("Weight:")
                Text(item.Weight)
            }
        }
        
    }
    init(){
        model.getData()
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
