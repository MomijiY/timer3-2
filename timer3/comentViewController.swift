//
//  comentViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/06/22.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

class comentViewController: UIViewController {
    var database: Firestore!
    
    @IBOutlet weak var comentLbl: UILabel!
    
    @IBOutlet weak var reroadbtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reroadbtnAc() {
        database.collection("coment").document("comment").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
                
            }
            guard let data = snap?.data() else { return }
            print(data["coment"]!)
            
            self.comentLbl.text = data["coment"] as? String
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
