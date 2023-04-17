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
        NavigationStack{
            ZStack{
                Color.teal
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(0.20))
                VStack{
                    Text("VIGOR")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .bold()
                        
                    Spacer()
                    
                    Text("[Logo here]")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                    
                    SecureField("password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                    
                    Button("Login"){
                        //Authenticate user
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.teal)
                    .cornerRadius(10)
                    
                    Text("Dont have an account?")
                        .font(.subheadline)
                    
                    Button("Sign Up"){
                        //direct to sign up form
                    }
                    .bold()
                    .foregroundColor(.black)
                    .background(Color.teal.opacity(0.05))
                    .frame(width: 100, height: 10)
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
    func authenticateUser(username: String, password: String){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
