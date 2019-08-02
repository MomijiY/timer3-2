//
//  FirstViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/06/14.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var label:  UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var haikei: UILabel!
    
    @IBOutlet weak var testdatefield: UITextField!
    
    @IBOutlet weak var daylabel: UILabel!
    
    @IBOutlet weak var testtitle: UILabel!
    
    @IBOutlet weak var userlabel: UILabel!
    
    @IBOutlet weak var newinfo: UIButton!
    
    @IBOutlet weak var kugire1: UILabel!
    
    @IBOutlet weak var todolist: UIButton!
    
    @IBOutlet weak var kugire2: UILabel!
    
    @IBOutlet weak var stymemory: UIButton!
    
    @IBOutlet weak var kugire3: UILabel!
    
    @IBOutlet weak var daytesbtn: UIButton!
    
    @IBOutlet weak var atoteslbl: UILabel!
    
    @IBOutlet weak var kugire4: UILabel!
    
    @IBOutlet weak var mokuhyou1: UITextField!
    
    @IBOutlet weak var checkcomment: UIButton!
    
    @IBOutlet weak var backbtn: UIButton!
    
    @IBOutlet weak var testmokuhyoulbl: UILabel!
    
    @IBOutlet weak var mokuhyou2: UITextField!
    
    @IBOutlet weak var mokuhyou3: UITextField!
    
    @IBOutlet weak var testnext: UIButton!
    
    
    
    @IBAction func daytesac(_ sender: Any) {
        haikei.isHidden = true
        testdatefield.isHidden = false
        daylabel.isHidden = true
        testtitle.isHidden = false
        userlabel.isHidden = true
        newinfo.isHidden = true
        kugire1.isHidden = true
        todolist.isHidden = true
        kugire2.isHidden = true
        stymemory.isHidden = true
        kugire3.isHidden = true
        daytesbtn.isHidden = true
        atoteslbl.isHidden = true
        kugire4.isHidden = true
        mokuhyou1.isHidden = false
        checkcomment.isHidden = true
        backbtn.isHidden = false
        testmokuhyoulbl.isHidden = false
        mokuhyou2.isHidden = false
        mokuhyou3.isHidden = false
        testnext.isHidden = false
    }
    
    
    
    @IBAction func backbtnac(_ sender: Any) {
        haikei.isHidden = false
        testdatefield.isHidden = true
        daylabel.isHidden = false
        testtitle.isHidden = true
        userlabel.isHidden = false
        newinfo.isHidden = false
        kugire1.isHidden = false
        todolist.isHidden = false
        kugire2.isHidden = false
        stymemory.isHidden = false
        kugire3.isHidden = false
        daytesbtn.isHidden = false
        atoteslbl.isHidden = false
        kugire4.isHidden = false
        mokuhyou1.isHidden = true
        checkcomment.isHidden = false
        backbtn.isHidden = true
        testmokuhyoulbl.isHidden = true
        mokuhyou2.isHidden = true
        mokuhyou3.isHidden = true
        testnext.isHidden = true
    }
    
    
    
    @IBAction func testnextac(_ sender: Any) {
        
        saveData.set(testdatefield.text, forKey: "testdate")
        
        saveData.set(mokuhyou1.text, forKey: "title1")
        saveData.set(mokuhyou2.text, forKey: "title2")
        saveData.set(mokuhyou3.text, forKey: "title3")
        
        haikei.isHidden = false
        testdatefield.isHidden = true
        daylabel.isHidden = false
        testtitle.isHidden = true
        userlabel.isHidden = false
        newinfo.isHidden = false
        kugire1.isHidden = false
        todolist.isHidden = false
        kugire2.isHidden = false
        stymemory.isHidden = false
        kugire3.isHidden = false
        daytesbtn.isHidden = false
        atoteslbl.isHidden = false
        kugire4.isHidden = false
        mokuhyou1.isHidden = true
        checkcomment.isHidden = false
        backbtn.isHidden = true
        testmokuhyoulbl.isHidden = true
        mokuhyou2.isHidden = true
        mokuhyou3.isHidden = true
        testnext.isHidden = true
    }
    
    func getToday(format:String = "dd") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
    
    var saveData: UserDefaults = UserDefaults.standard
    var testdatePicker: UIDatePicker = UIDatePicker()
    var testdatePicker2: UIDatePicker = UIDatePicker()
    
    @objc func done_timer() {
        testdatefield.endEditing(true)
        
        let formtter = DateFormatter()
        
        formtter.dateFormat = "yyyy年MM月dd日"
        
        testdatefield.text = "\(formtter.string(from: testdatePicker.date))"
    }
    
    // ユーザー名
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testdatePicker.datePickerMode = UIDatePicker.Mode.date
        testdatePicker.timeZone = NSTimeZone.local
        testdatePicker.locale = Locale.current
        testdatefield.inputView = testdatePicker
        
        testdatePicker2.datePickerMode = UIDatePicker.Mode.date
        testdatePicker2.timeZone = NSTimeZone.local
        testdatePicker2.locale = Locale.current
        
        
        testdatefield.text = saveData.object(forKey: "testdate") as? String
        
        // 決定バーの生成
        let toolbar_date = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar_date.setItems([spacelItem, doneItem], animated: true)
        
        
        
        testdatefield.inputView = testdatePicker
        testdatefield.inputAccessoryView = toolbar_date
        
        
        
        testdatefield.delegate = self
        
        mokuhyou1.delegate = self
        mokuhyou2.delegate = self
        mokuhyou3.delegate = self
        
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.sizeToFit()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(testsViewController.commitButtonTapped))
        
        toolBar.items = [spacer, commitButton]
        
        haikei.isHidden = false
        testdatefield.isHidden = true
        daylabel.isHidden = false
        testtitle.isHidden = true
        userlabel.isHidden = false
        newinfo.isHidden = false
        kugire1.isHidden = false
        todolist.isHidden = false
        kugire2.isHidden = false
        stymemory.isHidden = false
        kugire3.isHidden = false
        daytesbtn.isHidden = false
        atoteslbl.isHidden = false
        kugire4.isHidden = false
        mokuhyou1.isHidden = true
        checkcomment.isHidden = false
        backbtn.isHidden = true
        testmokuhyoulbl.isHidden = true
        mokuhyou2.isHidden = true
        mokuhyou3.isHidden = true
        testnext.isHidden = true
        
        label.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: 150)
        label.textAlignment = NSTextAlignment.center
        
        label.numberOfLines = 2
        self.view.addSubview(label)
        
        let now = Date()
        
//        let decimal = 3.14
//        let decimal2 = decimal * 10
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        label.text = formatter.string(from: now)
        // Do any additional setup after loading the view.
        
        // ユーザー名を表示
        userLabel.text = userName
        
        // ユーザー名を表示
        if let userName = UserDefaults.standard.string(forKey: "userNameKey") {
            userLabel.text = "\(userName)さんこんにちは。"
        } else {
            userLabel.text = "読み込めなかった時"
        }
        
        
//        let aDay = now
//        let bDay = Date(timeIntervalSince1970: TimeInterval((60*60*15) - 1)) // Jan 1, 1970 at 11:59 PM
//        let cDay = Date(timeIntervalSince1970: TimeInterval((60*60*39) - 1)) // Jan 2, 1970 at 11:59 PM
//
//        let diff1 = aDay.differenceInDay(bDay)
//        let diff2 = aDay.differenceInDay(cDay)
//
//        print(diff1) // -1
//        print(diff2) // 0
        
//        let myDateFormatter = DateFormatter()
//        myDateFormatter.dateFormat = "dd日"
//        let day1:Date = myDateFormatter.date(from: "")!
//        let day2:Date = myDateFormatter.date(from: "")!
//        let dayInterval = (Calendar.current.dateComponents([.day], from: day1, to: day2)).day
//        print(dayInterval!)
        
//        print("テストまであと\(floor(decimal2) / 10)日") // 3.1 (切り捨て)
//        testLabel.text = "テストまであと\(floor(decimal2) / 10)日"
    }
    
    @objc func done() {
        testdatefield.endEditing(true)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy年MM月dd日"
        
        testdatefield.text = "\(formatter.string(from: testdatePicker.date))"
    }
    
    
    
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
    }

}
extension Date {
    func differenceInDay(_ date: Date) -> Int {
        let cal = Calendar(identifier: .gregorian)
        let lhs = cal.dateComponents([.year, .month, .day], from: self)
        let rhs = cal.dateComponents([.year, .month, .day], from: date)
        let components = cal.dateComponents([.day], from: lhs, to: rhs)
        return components.day!
    }
}
