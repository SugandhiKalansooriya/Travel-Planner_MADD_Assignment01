//
//  Places Service.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-27.
//

import Firebase
import UIKit

struct Place{
    var title :String
    var Area :String
    var Discription :String
    var id: String
    
    init(keyID: String ,dictionary:[String :Any]){
        self.title = dictionary["title"] as? String ?? ""
        self.Area = dictionary["Area"] as? String ?? ""
        self.Discription = dictionary["Discription"] as? String ?? ""
        self.id = dictionary["id"] as? String ?? ""
    }
    
    
    
}


struct PlaceService {
    static let shared = PlaceService()
    let DB_REF = Database.database().reference()
    
    func fetchAllPlaces(completion:@escaping([Place])-> Void){
        var allPlaces = [Place]()
        
        DB_REF.child("Places").observe(.childAdded){(snapshot) in
            fetchSinglePlace(id: snapshot.key){(place)in
              allPlaces.append(place)
              completion(allPlaces)
            }
        }
    }
    
    func fetchSinglePlace(id:String, completion : @escaping(Place)-> Void){
        DB_REF.child("Places").child(id).observeSingleEvent(of: .value){
            (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any]
            else {return}
            let Place = Place(keyID: id, dictionary:dictionary)
            completion(Place)
        }
    }
    
    
    func uploadPlace(text1:String , text2:String ,text3:String ,completion :@escaping(Error? ,DatabaseReference)->Void){
        let values = ["title": text1 , "Area": text2 , "Discription" : text3] as [String: Any]
        let id = DB_REF.child("Places").childByAutoId()
        id.updateChildValues(values,withCompletionBlock: completion)
        id.updateChildValues(values){(err,ref) in
            
            let values = ["id":id.key!]
            DB_REF.child("Places").child(id.key!).updateChildValues(values,withCompletionBlock: completion)
        }
 
    }
    
    func deletePlace(id: String, completion: @escaping (Error?, DatabaseReference) -> Void) {
        DB_REF.child("Places").child(id).removeValue(completionBlock: completion)
    }

}
