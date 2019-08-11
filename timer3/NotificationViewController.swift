//
//  NotificationViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/06/15.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastnotification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pastcell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "pastnotification", for: indexPath)
        
        pastcell.textLabel?.text = ntfLabel.text
        
        pastcell.textLabel?.numberOfLines=0
        
        return pastcell
    }
    
    
    var  database: Firestore!
    
    let saveData: UserDefaults = UserDefaults.standard
    
    
    
    @IBOutlet weak var lookBtn: UIButton!
    
    @IBOutlet weak var ntfLabel: UILabel!
    
    @IBOutlet weak var kousinbtn: UIButton!
    
    @IBOutlet weak var pastbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "pastnoti") != nil {
            pastnotification = UserDefaults.standard.object(forKey: "pastnoti") as! [String]
        }
        
        self.saveData.set(pastnotification, forKey: "pastnoti")
        
        pastnotification =  UserDefaults.standard.object(forKey: "pastnoti")  as! [String]
        
        database = Firestore.firestore()
    }
    
    @IBAction func seepastntf() {
 
        }
        
        //セルの編集許可
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
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
        
        //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //戻り値の設定(表示するcell数)
            return pastnotification.count
        }
        
        //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let pastcell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "pastnotification", for: indexPath)
            
            pastcell.textLabel?.text = ntfLabel.text
            pastcell.textLabel?.numberOfLines=0
            
            
            //入力したテキストを配列に格納
            pastnotification.append(ntfLabel.text!)
            //セルをリロード
            tableView.reloadData()
            
            
        database.collection("teacher_data").document("example").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
                
            }
            guard let data = snap?.data() else { return }
            print(data["text"]!)
            

            self.ntfLabel.text = data["text"] as? String
    }
            return pastcell

}
 
}

}
