//
//  AlreadyMember.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 2/18/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AlreadyMember: UIViewController {
    
    @IBOutlet var emailLoginField: UITextField!
    @IBOutlet var passwordLoginField: UITextField!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if emailLoginField.text == "" {
                    let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
        
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
        
                    present(alertController, animated: true, completion: nil)
        
                } else {
            Auth.auth().createUser(withEmail: emailLoginField.text!, password: passwordLoginField.text!) { (user, error) in
        
                        if error == nil {
                            print("You have successfully signed up")
                            //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
        
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                            self.present(vc!, animated: true, completion: nil)
        
                        } else {
                            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
        
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                }
        
    }

}
