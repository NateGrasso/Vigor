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
    
    @State var Date = ""
    @State var Exercise = ""
    @State var Set = ""
    @State var Reps = ""
    @State var Weight = ""
    
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
        VStack{
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
        
        
        VStack(spacing: 5){
            TextField("Date", text: $Date)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Exercise", text: $Exercise)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Set", text: $Set)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Reps", text: $Reps)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Weight", text: $Weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                //Call add data
                model.addData(Date: Date, Exercise: Exercise, Set: Set, Reps: Reps, Weight: Weight)
                //Clear the text field
                Date = ""
                Exercise = ""
                Set = ""
                Reps = ""
                Weight = ""
                
            }, label: {
                Text("Add Workout")
            })
        }
        .padding()
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
