//
//  TodoListViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/07/02.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    class Item {
        var title : String
        var done : Bool = false
        
        init(title: String) {
            self.title = title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
