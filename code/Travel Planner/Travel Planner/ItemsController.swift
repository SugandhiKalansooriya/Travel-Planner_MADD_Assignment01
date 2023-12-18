//
//  itemsController.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-25.
//

import Foundation

import UIKit


class itemsController: UITableViewController {
    
    
    var items = [Item](){
        didSet{
            print("item was set")
            tableView.reloadData()
        }
    }
    let reuseIdentifier = "ItemCell"
    
    
    lazy var createNewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .systemMint
        button.setImage(UIImage(systemName: "plus.circle"),for: .normal)
        button.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        button.addTarget(self, action: #selector(createNewTodo), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Pack Your Bags"
        ItemService.shared.fetchAllItem{(allItems) in
            self.items = allItems
        }
        // Do any additional setup after loading the view.
    }
    
   
    
    @objc func createNewTodo(){
        let vc = AdditemController()
        present(vc, animated: true, completion: nil)
    }
    
    
    
    func configureTableView(){
        tableView.backgroundColor = .white
        
        tableView.register(ItemCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 75
        tableView.separatorColor = .black
        tableView.separatorInset = UIEdgeInsets(top : 0 , left: 16 , bottom: 0, right: 16)
        
        tableView.tableFooterView = UIView()
        
        
        tableView.addSubview(createNewButton)
        createNewButton.anchor(bottom:tableView.safeAreaLayoutGuide.bottomAnchor, right: tableView.safeAreaLayoutGuide.rightAnchor, paddingBottom: 16 , paddingRight: 16, width: 76 , height: 76)
        createNewButton.layer.cornerRadius = 56 / 2
        createNewButton.alpha = 1
    }


}


extension itemsController{
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section : Int) -> Int {
        return items.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ItemCell else { return UITableViewCell()}
        cell.item = items[indexPath.row]
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Item = items[indexPath.row]
       
        if Item.isComplete == false{
            ItemService.shared.updateItemStatus(itemId: Item.id, isComplete: true) { (err, ref) in
                self.tableView.deselectRow(at: indexPath, animated: true)
                ItemService.shared.fetchAllItem{(allItems) in
                    self.items = allItems
                }
            }
        }
        
        else {
            ItemService.shared.updateItemStatus(itemId: Item.id, isComplete: false) { (err, ref) in
                self.tableView.deselectRow(at: indexPath, animated: true)
                ItemService.shared.fetchAllItem{(allItems) in
                    self.items = allItems
                }
            }

            
        }
      
    }

}
