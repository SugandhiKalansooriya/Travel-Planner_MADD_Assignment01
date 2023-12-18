//
//  ItemService.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-25.
//

import Foundation
import Firebase
import UIKit

struct Item{
    var title :String
    var isComplete : Bool
    var id: String
    
    init(keyID: String ,dictionary:[String :Any]){
        self.title = dictionary["title"] as? String ?? ""
        self.isComplete = dictionary["isComplete"] as? Bool ??
         false
        self.id = dictionary["id"] as? String ?? ""
    }
    
    
    
}






struct ItemService {
    static let shared = ItemService()
    let DB_REF = Database.database().reference()
    
    func fetchAllItem(completion:@escaping([Item])-> Void){
        var allItems = [Item]()
        
        DB_REF.child("items").observe(.childAdded){(snapshot) in
          fetchSingleItem(id: snapshot.key){(item)in
              allItems.append(item)
              completion(allItems)
            }
        }
    }
    
    func fetchSingleItem(id:String, completion : @escaping(Item)-> Void){
        DB_REF.child("items").child(id).observeSingleEvent(of: .value){
            (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any]
            else {return}
            let Item = Item(keyID: id, dictionary:dictionary)
            completion(Item)
        }
    }
    
    
    func uploadItem(text:String , completion :@escaping(Error? ,DatabaseReference)->Void){
        let values = ["title": text , "isCompleted": false] as [String: Any]
        let id = DB_REF.child("items").childByAutoId()
        id.updateChildValues(values,withCompletionBlock: completion)
        id.updateChildValues(values){(err,ref) in
            
            let values = ["id":id.key!]
            DB_REF.child("items").child(id.key!).updateChildValues(values,withCompletionBlock: completion)
        }
 
    }
    
    func updateItemStatus(itemId:String , isComplete : Bool, completion: @escaping(Error?, DatabaseReference)-> Void){
        let value = ["isComplete": isComplete]
        DB_REF.child("items").child(itemId).updateChildValues(value,withCompletionBlock: completion)
    }

}
