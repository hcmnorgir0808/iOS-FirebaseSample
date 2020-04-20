//
//  StorageViewController.swift
//  iOS-FirebaseSample
//
//  Created by yaiwamoto on 20/04/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit
import FirebaseStorage

class StorageViewController: UIViewController {

    @IBOutlet weak var data: UITextView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicatorView.hidesWhenStopped = true
        indicatorView.startAnimating()
        
        data.layer.borderColor = UIColor.black.cgColor
        data.layer.borderWidth = 1.0
        
        let storage = Storage.storage()
        
        let txtRef = storage.reference(withPath: "sample.txt")
        let MAX_SIZE: Int64 = 1024 * 1024
        txtRef.getData(maxSize: MAX_SIZE) { [weak self] result, error in
            guard let strongSelf = self else { return }
            if error == nil {
                strongSelf.data.text = String(data: result!, encoding: String.Encoding.utf8)
                strongSelf.indicatorView.stopAnimating()
            }
        }
    }

}
