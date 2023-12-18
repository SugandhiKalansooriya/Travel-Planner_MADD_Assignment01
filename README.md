Please go under edit and edit this file as needed for your project.  There is no seperate documentation needed.

# Project Name - Travel Planner
# Student Id - IT20137700
# Student Name - Kalansooriya S.H

#### 01. Brief Description of Project - 
This application help for travelers that can note about their intertrasting placess. And through this app travelers can make the note about the items that they are need to be packed in when they are traveling



#### 02. Users of the System -  Travelers




#### 03. What is unique about your solution -
users can make a list of items that they needed to be paced when they are thraveling. using a swichUI user can change the paced or unpacked status




#### 04. Briefly document the functionality of the screens you have (Include screen shots of images)

[Screen 1](Resources/screen1.png)  
Launch Screen

[Screen 2](Resources/screen2.png)  
Home Page. form here user can navigate to the bage packing function and places adding function

[Screen 3](Resources/screen3.png)  
User can add the details about places that they hope to travel. Place, area and discription can be addded

[Screen 4](Resources/screen4.png)  
User can view the details about places that they added before.

[Screen 5](Resources/screen5.png)  
User can view the list of item that they need to be packed when they are traveling. they can note down the item by a swich the relevent item is packed or not

[Screen 6](Resources/screen6.png)  
User can add the items that they need to be packed when they are traveling

#### 05. Give examples of best practices used when writing code


 The code below uses consistant naming conventions for variables, uses structures and constants where ever possible.


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





06. UI Components used


  UIButton,
  UITextField
  UILabel
  UISwitch
  UITableViewCell        
  UIAlertController
  UITableViewController
  UIViewController
  UINavigationController
  UIView
  UIVisualEffectView

#### 07. Testing carried out

e.g. The following classes implemented unit testing for the  ```Item struct```  and ```ItemService struct```. 

import XCTest
@testable import Travel_Planner

class ItemTests: XCTestCase {
    
    func testInitWithDictionary() {
        let itemDict = ["title": "Test Item", "isComplete": true, "id": "123"] as [String : Any]
        let item = Item(keyID: "123", dictionary: itemDict)
        
        XCTAssertEqual(item.title, "Test Item")
        XCTAssertTrue(item.isComplete)
        XCTAssertEqual(item.id, "123")
    }
}


import XCTest
@testable import Travel_Planner

class ItemServiceTests: XCTestCase {

    var itemService: ItemService!

    override func setUp() {
        super.setUp()
        itemService = ItemService.shared
    }

    override func tearDown() {
        itemService = nil
        super.tearDown()
    }

    func testFetchAllItem() {
        let expectation = XCTestExpectation(description: "Fetch all items")
        itemService.fetchAllItem { items in
            XCTAssertGreaterThan(items.count, 0, "Items array should not be empty")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}



#### 08. Documentation 



(a) Design Choices


(b) Implementation Decisions
I was start the project to implemet the UI Interfaces by manually by draging the ui controllers to the canvas. but later i feel programmatically ui interface building is more easy. so i used both methods



(c) Challenges
 resoures less about uikit. 




#### 09. Reflection
 resources for learn uikit is leser than the other languages

  

