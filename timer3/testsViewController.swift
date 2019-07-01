//
//  testsViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/06/14.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class testsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var testdateField: UITextField!
    @IBOutlet weak var titleTextField1: UITextField!
    @IBOutlet weak var titleTextField2: UITextField!
    @IBOutlet weak var titleTextField3: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    var testdatePicker: UIDatePicker = UIDatePicker()
    
    @objc func done_timer() {
        testdateField.endEditing(true)
        
        let formtter = DateFormatter()
        
        formtter.dateFormat = "yyyy年MM月dd日"
        
        testdateField.text = "\(formtter.string(from: testdatePicker.date))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testdateField.text = saveData.object(forKey: "testdate") as? String
        titleTextField1.text = saveData.object(forKey: "title1") as? String
        titleTextField2.text = saveData.object(forKey: "title2") as? String
        titleTextField3.text = saveData.object(forKey: "title3") as? String
        
        testdateField.delegate = self
        titleTextField1.delegate = self
        titleTextField2.delegate = self
        titleTextField3.delegate = self
        
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.sizeToFit()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(testsViewController.commitButtonTapped))
        
        toolBar.items = [spacer, commitButton]
        
        
    
    }
    
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    
    @IBAction func MemorySave() {
        saveData.set(testdateField.text, forKey: "testdate")
        saveData.set(titleTextField1.text, forKey: "title1")
        saveData.set(titleTextField2.text, forKey: "title2")
        saveData.set(titleTextField3.text, forKey: "title3")
//        let alert: UIAlertController = UIAlertController(title: "OK", message: "メモの保存が完了しました", preferredStyle: .alert)
//
//        alert.addAction(
//            UIAlertAction(title: "OK", style: .default, handler: { action in
//
//                self.navigationController?.popViewController(animated: true)
//            }
//            )
//        )
//        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
    }
}
