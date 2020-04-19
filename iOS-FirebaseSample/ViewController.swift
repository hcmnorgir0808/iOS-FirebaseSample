//
//  ViewController.swift
//  iOS-FirebaseSample
//
//  Created by yaiwamoto on 20/04/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var changed: AuthStateDidChangeListenerHandle?
    
    var isLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pass.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changed = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.label.text = user?.email
            
            if user != nil {
                self.isLogin = true
                self.button.titleLabel?.text = "LogOut"
            } else {
                self.isLogin = false
                self.button.titleLabel?.text = "LogIn"
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if let changed = changed {
            Auth.auth().removeStateDidChangeListener(changed)
        }
    }
    
    @IBAction func doAction(_ sender: Any) {
        let email = self.email.text
        let pass = self.pass.text
        
        if isLogin {
            do {
                try Auth.auth().signOut()
            } catch {
                
            }
        } else {
            Auth.auth().signIn(withEmail: email ?? "", password: pass ?? "") { (user, error) in
                if error != nil {
                    self.label.text = error?.localizedDescription
                    return
                }
            }
        }
    }
}

