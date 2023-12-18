
import UIKit

class Places: UIViewController {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    
    // Text area
    let textArea = UITextView()
    

    
    // Button
    let button = UIButton(type: .system)
    let button1 = UIButton(type: .system)
    // Labels
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    
    @objc  func createPlacePressed(){
        guard let title = textField1.text else {return}
        guard let Area = textField2.text else {return}
        guard let Discription = textArea.text else {return}
        
        if (title.isEmpty){
            showAlert(title: "ERROR", message: "Required Field is missing. Enter the place name")
        }else{
            PlaceService.shared.uploadPlace(text1: title, text2: Area, text3: Discription){(err,ref) in
                self.textField1.text = ""
                self.textField2.text = ""
                self.textArea.text = ""
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func AllPlaces(){
        let vc = PlaceList()
        present(vc, animated: true, completion: nil)
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Set up the view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up labels
        label3.text = "Add Places"
        label3.font = UIFont.boldSystemFont(ofSize: 30)
        label3.translatesAutoresizingMaskIntoConstraints = false
        
        label1.text = "Landmark"
        label1.font = UIFont.boldSystemFont(ofSize: 18)
        label1.translatesAutoresizingMaskIntoConstraints = false
        
        label2.text = "Area"
        label2.font = UIFont.boldSystemFont(ofSize: 18)
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        label4.text = "Description"
        label4.font = UIFont.boldSystemFont(ofSize: 18)
        label4.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up text fields
        textField1.placeholder = "Enter landmark name"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.layer.borderColor = UIColor.lightGray.cgColor
        
        textField2.placeholder = "Enter area name"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.layer.borderColor = UIColor.lightGray.cgColor
        
        // Set up text area
        textArea.font = UIFont.systemFont(ofSize: 16)
        textArea.layer.borderWidth = 1
        textArea.layer.borderColor = UIColor.systemGray5.cgColor
        textArea.translatesAutoresizingMaskIntoConstraints = false
        
        
        
  
        // Set up button
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemCyan
        button.tintColor = .black
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(createPlacePressed), for: .touchUpInside)
             
      
        button1.setTitle("All Places", for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button1.backgroundColor = .black
        button1.tintColor = .systemCyan
        button1.layer.cornerRadius = 20
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(AllPlaces), for: .touchUpInside)
 
     

    
        
        // Add subviews
        view.addSubview(label3)
        view.addSubview(label1)
        view.addSubview(textField1)
        view.addSubview(label2)
        view.addSubview(textField2)
        view.addSubview(label4)
        view.addSubview(textArea)
   
        view.addSubview(button)
        view.addSubview(button1)
        // Set up constraints
        NSLayoutConstraint.activate([
            
         
            
            label3.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            label1.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 40),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            textField1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            textField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField1.heightAnchor.constraint(equalToConstant: 40),
            
            label2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            textField2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            textField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField2.heightAnchor.constraint(equalToConstant: 40),
            
            label4.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
            label4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            textArea.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 20),
            textArea.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textArea.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textArea.heightAnchor.constraint(equalToConstant: 100),
       
           

            
            button.topAnchor.constraint(equalTo: textArea.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 120),
            
          
            button1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            button1.heightAnchor.constraint(equalToConstant: 50),
           
           
           
            
        ])
    }
    
    @objc func submitButtonTapped() {
        // Handle submit button tapped event
        // You can access the values entered by the user in the text fields, text area, and slider using the corresponding properties (textField1.text, textField2.text, textArea.text, slider.value)
    }
}
