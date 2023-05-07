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
    
    func deleteData(workoutToDelete: Workouts){
        
        //Get a reference to the data base
        let db = Firestore.firestore()
        
        //Specify data(document) to delete
        db.collection("Workouts").document(workoutToDelete.id).delete { error in
            
            //Check if document was deleted
            if error == nil{
                //No errors
                
                //Update UI from the main thread
                DispatchQueue.main.async{
                    
                    //Remove Workout that was just deleted
                    self.list.removeAll{Workouts in
                        
                        //check for the workout to remove
                        return Workouts.id == workoutToDelete.id
                    }
                }
                
            }
        }
    }
    
    func addData(Date: String, Exercise: String, Set: String, Reps: String, Weight: String){
        
        //Get a reference to the data base
        let db = Firestore.firestore()
        
        //Add a document to the collection
        db.collection("Workouts").addDocument(data: ["Date":Date, "Exercise":Exercise, "Set":Set, "Reps":Reps, "Weight":Weight]){
            error in
            
            //Check for error
            if error == nil{
                //no errors
                
                //Call get data to retrieve latest data
                self.getData()
            }
            else{
                //handle error
            }
        }
    }
    
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
