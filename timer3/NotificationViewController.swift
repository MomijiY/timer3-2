//
//  NotificationViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/06/15.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

class NotificationViewController: UIViewController {
    
    var  database: Firestore!
    
    
    @IBOutlet weak var lookBtn: UIButton!
    
    @IBOutlet weak var ntfLabel: UILabel!
    
    @IBOutlet weak var kousinbtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        database = Firestore.firestore()
    }
    
    @IBAction func btnLook() {
        let alert: UIAlertController = UIAlertController(title: "OK", message: "見ましたボタンを押す", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: {action in
                
                self.navigationController?.popViewController(animated: true)
            }
        )
        )
    present(alert, animated: true, completion: nil)
    }
    
    @IBAction func kousinBtn() {
        database.collection("teacher_data").document("example").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
                
            }
            guard let data = snap?.data() else { return }
            print(data["text"]!)
            
            self.ntfLabel.text = data["text"] as? String
    }

}
}
