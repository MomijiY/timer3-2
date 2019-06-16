//
//  NotificationViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/06/15.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var lookBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
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

}
