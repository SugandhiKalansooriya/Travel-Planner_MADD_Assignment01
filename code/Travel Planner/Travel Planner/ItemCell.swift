//
//  ItemCell.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-25.
//

import UIKit

class ItemCell: UITableViewCell {

    var item :Item?{
        didSet{
            titleLabel.text = item?.title
            if let iscomplete = item?.isComplete ,iscomplete{
                statuslabel.text = "status : Packed"
                statuslabel.textColor = .systemTeal
                switchControl.isOn = true

            }else{
                statuslabel.text = "status : Unpacked"
                statuslabel.textColor = .red
                switchControl.isOn = false
            }
         

        }
    }
    
    
    @objc private func handleSwitch() {
        item?.isComplete = switchControl.isOn
        if switchControl.isOn {
            statuslabel.text = "status : Packed"
            statuslabel.textColor = .systemMint
        } else {
            statuslabel.text = "status : Unpacked"
            statuslabel.textColor = .red
        }
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize:24)
        label.textColor = .black
        label.text = "Title label"

        return label
    }()
    private let statuslabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize:24)
        label.textColor = .white
        label.text = "Status : UnPacked"

        return label
    }()
    
    
        private let switchControl: UISwitch = {
            let switchControl = UISwitch()
            switchControl.onTintColor = .systemMint
            return switchControl
        }()
    
  

    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .systemGray5

        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor , left: leftAnchor ,paddingTop: 4 , paddingLeft: 8)
        addSubview(statuslabel)
        statuslabel.anchor(top: titleLabel.bottomAnchor , left: leftAnchor ,paddingTop: 4 , paddingLeft: 8)
        addSubview(switchControl)
        switchControl.anchor(top: topAnchor, right: rightAnchor, paddingTop: 4, paddingRight: 8)
    }


    required init?(coder : NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}


