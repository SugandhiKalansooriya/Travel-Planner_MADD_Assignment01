//
//  PlacesList.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-27.
//



import UIKit

class PlaceList: UITableViewController {
    
    
    var places = [Place](){
        didSet{
            print("PLACE was set")
            tableView.reloadData()
        }
    }
    let reuseIdentifier = "PlaceCell"
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        PlaceService.shared.fetchAllPlaces{(allplaces) in
            self.places = allplaces
        }
       
        // Do any additional setup after loading the view.
    }
    
   

    
    
    
    func configureTableView(){
        tableView.backgroundColor = .darkGray
        tableView.register(PlaceCell.self, forCellReuseIdentifier: reuseIdentifier)

        tableView.rowHeight = 180

        tableView.separatorColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)

        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        tableView.tableFooterView = UIView()


    }


}


extension PlaceList{
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section : Int) -> Int {
        return places.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? PlaceCell else { return UITableViewCell()}
        cell.place = places[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
