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
    
    var changed: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "email & pass"
        pass.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changed = Auth.auth().addStateDidChangeListener { (auth, user) in
            self.label.text = user?.email
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
        Auth.auth().signIn(withEmail: email ?? "", password: pass ?? "") { (user, error) in
            if error != nil {
                self.label.text = error?.localizedDescription
                return
            }
        }
    }
    
}

