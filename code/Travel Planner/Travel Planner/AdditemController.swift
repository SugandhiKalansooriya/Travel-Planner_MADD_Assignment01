//
//  AdditemController.swift
//  Travel Planner
//
//  Created by Sugandhi Hansika Kalansooriya on 2023-04-25.
//



//import UIKit
//
//class AdditemController: UIViewController {
//
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = .boldSystemFont(ofSize:28)
//        label.textColor = .black
//        label.text = "Add New Item to List"
//        label.textAlignment = .center
//
//        return label
//    }()
//
//    private let itemTextField: UITextField = {
//        let tf = UITextField()
//        tf.font = .systemFont(ofSize: 24)
//        tf.textColor = .black
//        tf.backgroundColor = .gray
//
//        return tf
//    }()
//
//
//
//
//    lazy var createButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Create item", for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
//        button.setTitleColor(.white
//                             , for: .normal)
//        button.backgroundColor = .systemTeal
//        button.layer.cornerRadius = 20
//
//       button.addTarget(self, action: #selector(createItemPressed), for: .touchUpInside)
//        return button
//    }()
//
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       configureUI()
//    }
//
//    @objc func createItemPressed(){
//        guard let todoText = itemTextField.text else {return}
//        //PostService.shared.uploadTodoItem(text: todoText)
//        ItemService.shared.uploadItem(text: todoText){(err,ref) in
//            self.itemTextField.text = ""
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
//
//    func configureUI(){
//        view.backgroundColor = .white
//        view.addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
//
//        view.addSubview(itemTextField)
//        itemTextField.translatesAutoresizingMaskIntoConstraints = false
//        itemTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32).isActive = true
//        itemTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
//        itemTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
//        itemTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        itemTextField.delegate = self
//
//        view.addSubview(createButton)
//        createButton.translatesAutoresizingMaskIntoConstraints = false
//        createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
//        createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
//        createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
//        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }
//
//
//}
//
//extension AdditemController:UITextFieldDelegate{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}

import UIKit

class AdditemController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize:28)
        label.textColor = .black
        label.text = "Add New Item to List"
        label.textAlignment = .center

        return label
    }()

    private let itemTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
        tf.textColor = .black
        tf.backgroundColor = .systemGray4
        tf.borderStyle = .roundedRect
        tf.placeholder = "Enter item name"

        return tf
    }()

    lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create item", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 20

        button.addTarget(self, action: #selector(createItemPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    @objc func createItemPressed(){
        guard let todoText = itemTextField.text else {return}
        //PostService.shared.uploadTodoItem(text: todoText)
        
        if (todoText.isEmpty){
            showAlert(title: "ERROR", message: "Required Field is missing. Enter the item ")
          
        }
       
    else {
        ItemService.shared.uploadItem(text: todoText){(err,ref) in
            self.itemTextField.text = ""
            self.dismiss(animated: true, completion: nil)
        }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true

        view.addSubview(itemTextField)
        itemTextField.translatesAutoresizingMaskIntoConstraints = false
        itemTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32).isActive = true
        itemTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        itemTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        itemTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        itemTextField.delegate = self

        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        createButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension AdditemController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
