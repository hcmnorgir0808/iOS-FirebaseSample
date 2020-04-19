//
//  FireStoreViewController.swift
//  iOS-FirebaseSample
//
//  Created by yaiwamoto on 20/04/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FireStoreViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var data: UITextView!
    
    var db: Firestore?
    var people: CollectionReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.db = Firestore.firestore()
        self.people = db?.collection("people")
        
        self.people?.addSnapshotListener() { (querySnapshot, err) in
            var res = ""
            querySnapshot?.documents.forEach {
                let nm = $0.get("name") as! String
                let ml = $0.get("mail") as! String
                let ag = $0.get("age") as! Int
                res += nm + "[" + ml + ":" + String(ag) + "]" + "\n"
            }
            self.data.text = res
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func doAction(_ sender: Any) {
        if let nm = name.text,
            let ml = mail.text,
            let age = age.text,
            let ag = Int(age) {
            let data = [
                "name": nm,
                "mail": ml,
                "age": ag
            ] as [String : Any]

            people?.addDocument(data: data)
        }
    }
    
    
}
