//
//  WorkoutView.swift
//  Vigor
//
//  Created by Nathan Grasso on 4/23/23.
//

import SwiftUI
import Firebase


struct WorkoutView: View {
    @State private var exercise: String = ""
    @State private var set: String = ""
    @State private var rep: String = ""
    
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
            }
            
            
//            HStack{
//                Image(systemName: "flame")
//                TextField("Exercise", text: $exercise)
//                    .padding()
//                    .overlay(RoundedRectangle(cornerRadius: 10)
//                    .stroke(lineWidth: 2)
//                    .foregroundColor(.black)
//                    )
//                HStack{
//                    TextField("Sets", text: $set)
//                        .padding()
//                        .overlay(RoundedRectangle(cornerRadius: 10)
//                        .stroke(lineWidth: 2)
//                        .foregroundColor(.black)
//                        )
//                HStack{
//                    TextField("Reps", text: $rep)
//                        .padding()
//                        .overlay(RoundedRectangle(cornerRadius: 10)
//                        .stroke(lineWidth: 2)
//                        .foregroundColor(.black)
//                        )
//                }
//                }
//            }

            
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
