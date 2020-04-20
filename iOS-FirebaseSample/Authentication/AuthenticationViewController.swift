//
//  AuthenticationViewController.swift
//  iOS-FirebaseSample
//
//  Created by yaiwamoto on 20/04/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit
import Firebase

class AuthenticationViewController: UIViewController {

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
        changed = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let strongSelf = self else { return }
            self?.label.text = user?.email
            
            if user != nil {
                strongSelf.isLogin = true
                strongSelf.button.setTitle("LogOut", for: .normal)
            } else {
                strongSelf.isLogin = false
                strongSelf.button.setTitle("LogIn", for: .normal)
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
            Auth.auth().signIn(withEmail: email ?? "", password: pass ?? "") { [weak self] (user, error) in
                guard let strongSelf = self else { return }
                if error != nil {
                    strongSelf.label.text = error?.localizedDescription
                    return
                }
            }
        }
    }
}

