//
//  NameViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/06/19.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo() {
        print(textField.text!)
        
        saveData.set(textField.text, forKey: "Text")
        
        
        let alert: UIAlertController = UIAlertController(title: "OK", message: "記録の保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: { action in
                
                self.navigationController?.popViewController(animated: true)
            }
            )
        )
        present(alert, animated: true, completion: nil)
        
//        let data = [
//            "text": dateField.text!,
//            "page": manualfield.text!,
//            "subject": manuallabel3.text!
//
//            ] as [String: Any]
//
//        database.collection("data").document("example").setData(data){err in
//            if let err = err {
//                print("Error writiing document: \(err)")
//            }else {
//                print("Document successfully wriitten!")
//            }
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
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
