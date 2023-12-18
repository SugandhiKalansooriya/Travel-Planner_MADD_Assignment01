//
//  PlaceCell.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-27.
//

import UIKit


class PlaceCell: UITableViewCell {
    
    var place :Place?{
        didSet{

            
            titleLabel.text = (place?.title ?? " ")
            AreaLabel.text =  (place?.Area ?? " ")
            DiscriptionLabel.text =  (place?.Discription ?? " ")
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize:24)
        label.textColor = .black
        label.text = "Title label"
        
        return label
    }()
    
    private let AreaLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize:18)
        label.textColor = .black
        label.text = "Title label"
        
        return label
    }()
    
    private let DiscriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
 
    
    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor , left: leftAnchor ,paddingTop: 4 , paddingLeft: 8)
        
        addSubview(AreaLabel)
        AreaLabel.anchor(top: titleLabel.bottomAnchor , left: leftAnchor ,paddingTop: 4 , paddingLeft: 8)
        
        addSubview(DiscriptionLabel)
        DiscriptionLabel.anchor(top: AreaLabel.bottomAnchor , left: leftAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
    }
    
    
    required init?(coder : NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
