//
//  AddController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/07/11.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

//変数の設置
var TodoKobetsunonakami = [String]()
class AddController: UIViewController {
        //テキストフィールドの設定
        @IBOutlet weak var TodoTextField: UITextField!
        
        //追加ボタンの設定
        @IBAction func TodoAddButten(_ sender: Any) {
            //変数に入力内容を入れる
            TodoKobetsunonakami.append(TodoTextField.text!)
            //追加ボタンを押したらフィールドを空にする
            TodoTextField.text = ""
            //変数の中身をUDに追加
            UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
        }
        
        //最初からあるコード
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        //最初からあるコード
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }
