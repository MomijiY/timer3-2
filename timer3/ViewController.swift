//
//  ViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/02/11.
//  Copyright © 2019 吉川椛. All rights reserved.
//

//  AddController.swift
import UIKit

var TodoKobetsunonakami = [String]()

class TodoListViewController: UITableViewController {

        //テキストフィールドの設定
        @IBOutlet weak var TodoTextField: UITextField!
    //Button
        @IBOutlet weak var TodoAddBtn: UIButton!
        
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
    

    
//    // MARK - チェックマーク機能
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // 選択されたセルに実行される処理
//
//        let item = TodoKobetsunonakami[indexPath.row]
//
//        // チェックマーク
//        item.done = !item.done
//
//        // リロードしてUIに反映
//        self.tableView.reloadData()
//
//        // セルを選択した時の背景の変化を遅くする
//        tableView.deselectRow(at: indexPath, animated: true)
//
//    }
//
//
//    //スワイプでのアイテム削除
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        TodoKobetsunonakami.remove(at: indexPath.row)
//        _ = [indexPath]
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        //アプリ内に保存されているarrayというキーの配列arrayを取り出して、showArrayに代入する。
//        if UserDefaults.standard.object(forKey: "array") != nil{
//
//            TodoKobetsunonakami = UserDefaults.standard.object(forKey: "array") as! [String]
//        }
//    }
}
