//
//  ViewController.swift
//  UserLogin
//
//  Created by Ehab on 27/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Welcome to my small app!"
    }

    @IBAction func SignInButton(_ sender: Any) {
        let defaults : UserDefaults = UserDefaults.standard
         
        
        if usernameText.text != (defaults.value(forKey: "username")  as? String) || passwordText.text != defaults.value(forKey: "password") as? String{
            
            let alert : UIAlertController = UIAlertController(title: "Alert!", message: "Your username or password is incorrect", preferredStyle: .alert)
            let cancel : UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(cancel)
            present(alert, animated: true)
        
        }
        else{
            let alert : UIAlertController = UIAlertController(title: "Success", message: "Logged in successfully", preferredStyle: .alert)
            let ok : UIAlertAction  = UIAlertAction (title: "Ok", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
            
        }
        
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(usernameText.text, forKey: "username")
        defaults.set(passwordText.text, forKey: "password")
        //defaults.synchronize()
        usernameText.text = ""
        passwordText.text = ""
    }
}

