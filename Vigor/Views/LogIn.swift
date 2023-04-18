//
//  LogIn.swift
//  Vigor
//
//  Created by Nathan Grasso on 4/18/23.
//

import SwiftUI

struct LogIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    private func isValidPassword(_ password: String)-> Bool {
        // minimum 8 characters long
        // 1 uppercase character
        // 1 special case character
        // 1 number
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%?])[0-9A-Za-z!@#$%?]{8,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack{
            Color.teal.edgesIgnoringSafeArea(.all)
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white.opacity(0.30))
            VStack{
                Text("VIGOR")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                
                    Spacer()
                    
                    if(email.count != 0){
                        
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .bold()
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(.black)
                )
                
                .padding()
                
                HStack{
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                    
                    Spacer()
                    
                    if(password.count != 0){
                        
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .bold()
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(.black)
                )
                
                .padding()
                
                Text("Dont have an account?")
                
                    .padding(.bottom)
                
                Button(action: {}){
                    Text("Create Account")
                        .foregroundColor(.black)
                        .bold()
                }
                Spacer()
                
                Button{
                } label: {
                Text("Sign In")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
