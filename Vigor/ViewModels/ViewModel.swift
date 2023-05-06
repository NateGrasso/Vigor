//
//  ViewModel.swift
//  Vigor
//
//  Created by Nathan Grasso on 4/30/23.
//

import Foundation
import Firebase

class ViewWorkouts: ObservableObject{
    
    @Published var list = [Workouts]()
    
    func getData(){
        
        //Get a reference to the database
        let db = Firestore.firestore()
        
        //Read the document at a specific path
        db.collection("Workouts").getDocuments{snapshot, error in
            
            //check for errors
            if error == nil{
                //no errors
                
                if let snapshot = snapshot{
                    
                    //Update the list property in the main thread
                    DispatchQueue.main.async{
                        
                        //get all the documents and create workouts
                        self.list = snapshot.documents.map{d in
                            
                            //Create a Workout for each document returned
                            return Workouts(id: d.documentID,
                                            Date: d["Date"] as? String ?? "",
                                            Exercise: d["Exercise"] as? String ?? "",
                                            Set: d["Set"] as? String ?? "",
                                            Reps: d["Reps"] as? String ?? "",
                                            Weight: d["Weight"] as? String ?? "")
                        }
                    }
                }
            }
            else{
                //handle the error
            }
        }
    }
}