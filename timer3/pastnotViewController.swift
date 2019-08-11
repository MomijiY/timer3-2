//
//  pastnotViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/08/10.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
var pastnotification = [String]()

class pastnotViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return pastnotification.count
    }
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pastcell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "pastnotification", for: indexPath)
        
        pastcell.textLabel?.text = pastnotification[indexPath.row]
        
        return pastcell
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "pastnoti") != nil {
            pastnotification = UserDefaults.standard.object(forKey: "pastnoti") as! [String]
        }

        // Do any additional setup after loading the view.
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
