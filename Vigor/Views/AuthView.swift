//
//  AuthView.swift
//  Vigor
//  
//  Created by Nathan Grasso on 4/20/23.
//

import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "LogIn" // login or create account
    
    var body: some View {
        
        if (currentViewShowing == "LogIn"){
            LogIn(currentShowingView: $currentViewShowing)
        } else{
            CreateAccount(currentShowingView: $currentViewShowing)
                .transition(.move(edge: .bottom))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
