//
//  ViewController.swift
//  noteAppDemoFirestore
//
//  Created by Phillip Eismark on 12/03/2019.
//  Copyright © 2019 Phillip Eismark. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnCreate: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.placeholder = "Email"
        tfPassword.placeholder = "Password"
        print(fR.getStatus())
    }
    

    @IBAction func loginButton(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            if let email = tfEmail.text, let password = tfPassword.text{
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if error == nil {
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "segue1", sender: self)
                            print("User Logged in")
                        }
                    }
                }
            }
        }
            
        else {
            do {
                try Auth.auth().signOut()
                print("Signed out")
            }
            catch{
                
            }
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        if let email = tfEmail.text, let password = tfPassword.text {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            print(Auth.auth().currentUser?.email ?? "No user email")
            print(Auth.auth().currentUser?.uid ?? "No user ID")
        })
        }
    }
}

