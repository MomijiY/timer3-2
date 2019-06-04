//
//  RemindViewController.swift
//  timer3
//
//  Created by 吉川椛 on 2019/03/25.
//  Copyright © 2019 吉川椛. All rights reserved.
//


import UIKit
import AVFoundation

class RemindViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    //スクリーンサイズの取得
    let screenSize = UIScreen.main.bounds.size
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    var printingImage: UIImage?
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataList.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    
   
    @IBOutlet var pickerView: UIPickerView! //科目のpicker
    
    var dataList = [
        "数学", "国語", "英語", "理科", "社会",
        "音楽", "技術・家庭科", "保健・体育", "美術",
        "書道", "道徳", "聖書", "塾", "その他", "プログラミング",
    ]
    
    var seconds = 30
    var timer = Timer()
    
    var audioPlayer: AVAudioPlayer!
    
    func setAudioPlayer(soundName: String, type: String) {
        
        let soundFilePath = Bundle.main.path(forResource: soundName, ofType: type)!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        } catch {
            print("音楽ファイルが読み込めませんでした")
        }
        
    }
    
    
   
    
    
    @IBAction func startbutton(_ sender: Any) {  //タイマーのstartボタン
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        setAudioPlayer(soundName: "start", type: "mp3")
        audioPlayer.play()
        
    }
    
    
    @IBAction func stopbutton(_ sender: Any) {  //タイマーのstopボタン
        if timer.isValid == true {  //もしタイマーが動いていたら
            timer.invalidate()      //タイマーを止める
        }
        
        timer.invalidate()
        seconds = 30
        setAudioPlayer(soundName: "stop", type: "mp3")
        audioPlayer.play()
        
    }
    
    
    @objc func updateTimer() {
        
        if timepicker.countDownDuration == 60  {
            timer.invalidate()
            
            setAudioPlayer(soundName: "Aleart", type: "mp3")
            audioPlayer.play()
            
        } else {
            timepicker.setDate(timepicker.date - 1, animated: true)
        }
        
        func timeString(time:TimeInterval) -> String {
            
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            
            return String(format: "%2d:%02d:%02d", hours,minutes,seconds)
            
        }
        
    }

    @IBOutlet weak var scSegment: UISegmentedControl!  //viewのセグメントコントロール
    
    var stopwatchtimer = Timer()                 // Timerクラス
    var startTime: TimeInterval = 0     // Startボタンを押した時刻
    var elapsedTime: Double = 0.0       // Stopボタンを押した時点で経過していた時間
    var time : Double = 0.0             // ラベルに表示する時間
    
    @IBOutlet weak var labelStopwatch: UILabel!     // タイムを表示するラベル
    
    @IBOutlet weak var buttonStart: UIButton!   // Startボタン
    @IBOutlet weak var buttonStop: UIButton!    // Stopボタン
    @IBOutlet weak var buttonReset: UIButton!   // Resetボタン
    
    @IBAction func Sharebutton(_ sender: Any) {  //共有ボタン
    }
    // Startボタンを押した時の処理
    @IBAction func tapStart() {
        
        buttonStart.isEnabled = false
        buttonReset.isEnabled = false
        
        buttonStop.isEnabled = true
        
        startTime = Date().timeIntervalSince1970
        // 0.01秒おきに関数「update」を呼び出す
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        buttonStart.layer.cornerRadius = 10
    }
    
    // 0.01秒ごとに呼び出される処理
    @objc func update() {
        // 経過時間は以下の式で計算する
        // (現在の時刻 - Startボタンを押した時刻) + Stopボタンを押した時点で経過していた時刻
        time = Date().timeIntervalSince1970 - startTime + elapsedTime
        // 時間を小数点前後で分割(小数点以下は2桁だけ取得)
        let sec = Int(time)
        
        // 「XX:XX:XX」形式でラベルに表示する
        let displayStr = NSString(format: "%2d:%02d:%02d", sec/3600, (sec/60)%60, sec%60) as String
        labelStopwatch.text = displayStr
    }
    
    // Stopボタンを押した時の処理
    @IBAction func tapStop() {
        
         buttonStop.layer.cornerRadius = 10
        
        // Startボタン、Resetボタンを有効化
        buttonStart.isEnabled = true
        buttonReset.isEnabled = true
        // Stopボタンを無効化
        buttonStop.isEnabled = false
        // タイマー処理を止める
        timer.invalidate()
        // 再度Startボタンを押した時に加算するため、これまでに計測した経過時間を保存
        elapsedTime = time
        
    }
    
    // Resetボタンを押した時の処理
    @IBAction func tapReset() {
        
         buttonReset.layer.cornerRadius = 100
        // 経過時間、ラベルを初期化する
        elapsedTime = 0.0
        labelStopwatch.text = "00:00:00"
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showActivityView() {
        let activityItems: Array<Any> = ["aaa"]
        
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        let excludedActivityTypes: Array<UIActivity.ActivityType> = [
        
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToTencentWeibo
        ]
        activityViewController.excludedActivityTypes = excludedActivityTypes
        
        activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, activityError: Error?) in
            
            guard completed else {return}
            
            switch activityType {
            case UIActivity.ActivityType.postToTwitter:
                print("Tweeted")
            case UIActivity.ActivityType.print:
                print("Printed")
            case UIActivity.ActivityType.saveToCameraRoll:
                print("Saved to Camera Roll")
            default:
                print("Done")
            }
        }
        
        self.present(activityViewController, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //manual・ページ数入力の時のキーボードの種類ー＞数字のみ
        manualfield.keyboardType = UIKeyboardType.numberPad
        
        // PickerView のサイズと位置
        pickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300)
        
        
        // PickerViewはスクリーンの中央に設定
        pickerView.center = self.view.center
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Label 位置はPickerViewより150上に設定、高さを２行表示分とる
        let yPosition = pickerView.frame.origin.y
        label.frame = CGRect(x: 0, y: yPosition - 100, width: self.view.frame.width, height: 100)
        
        // ラベルを1行表示
        label.numberOfLines = 1
        label.text = "30"
        // フォントサイズを大きく
        label.font = UIFont.systemFont(ofSize: 36)
        // テキストを中央寄せにする
        label.textAlignment = NSTextAlignment.center
        
        
        self.view.addSubview(pickerView)
        self.view.addSubview(label)
        
       label.isHidden = true
        reset.isHidden = true
        start.isHidden = true
        stop.isHidden = true
        timerstart.isHidden = true
        timerstop.isHidden = true
        timerLabel.isHidden = true
        stopwatchlabel.isHidden = true
        Sharebutton.isHidden = false
        teisyutubutton.isHidden = true
        timepicker.isHidden = true
    
    }
    
    //manual・ページ数入力の時キーボードをしまう方法ー＞text field 以外の部分をタッチ
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var label: UILabel!                //タイマーのラベル(30)
    @IBOutlet weak var reset: UIButton!               //ストップウォッチ（リセット）
    @IBOutlet weak var start: UIButton!               //ストップウォッチ（スタート）
    @IBOutlet weak var stop: UIButton!                //ストップウォッチ（ストップ）
    @IBOutlet weak var timerstart: UIButton!          //タイマー（スタート）
    @IBOutlet weak var timerstop: UIButton!           //タイマー（ストップ）
    @IBOutlet weak var stopwatchlabel: UILabel!       //ストップウォッチ（00:00:00）
    @IBOutlet weak var manuallabel: UILabel!          //手動入力(ページ数)
    @IBOutlet weak var manualfield: UITextField!      //手動入力(ページ数のtext field)
    @IBOutlet weak var manualpicker: UIDatePicker!    //手動入力(時間のピッカー)
    @IBOutlet weak var Sharebutton: UIButton!         //共有ボタン
    @IBOutlet weak var teisyutubutton: UIButton!      //提出ボタン
    @IBOutlet weak var timepicker: UIDatePicker!    //タイマーピッカー
  
    @IBAction func resetbutton(_ sender: Any) {   //ストップウォッチ
    }
    
    @IBAction func startbutton1(_ sender: Any) {   //ストップウォッチ
    }
    
    @IBAction func stopbutton2(_ sender: Any) {    //ストップウォッチ
    }
    
    @IBOutlet weak var timerLabel: UILabel!       //ストップウォッチ
    
    @IBAction func StartButton(_ sender: Any) {   //タイマー
    }
    
    @IBAction func StopButton(_ sender: Any) {    //タイマー
    }
    
    
    @IBOutlet weak var manualsublabel: UILabel!        //教科を表示するラベル（pickerに対応するラベル）
    
    
    @IBAction func manualpicker(_ sender: Any) {    //時間のpicker
    }
    
    @IBAction func manualfield(_ sender: Any) {     //ページ数のfield
    }

    @IBOutlet weak var manuallabel1: UILabel!   //ページ数
    
    
    @IBOutlet weak var manuallabel3: UILabel!  //科目pickerに対応させるlabel
    
    @IBOutlet weak var manualpicker2: UIPickerView!  //科目picker
    
    @IBAction func teisyutubutton(_ sender: Any) {   //提出ボタン
    }
    
    @IBAction func timepicker(_ sender: Any) {
    }
        
    
    @IBAction func segmentButton() {

        
        switch scSegment.selectedSegmentIndex {
        case 0:
            label.isHidden = true
            reset.isHidden = true
            start.isHidden = true
            stop.isHidden = true
            timerstart.isHidden = true
            timerstop.isHidden = true
            timerLabel.isHidden = true
            stopwatchlabel.isHidden = true
            manualpicker.isHidden = false
            manuallabel.isHidden = true
            manualfield.isHidden = false
            manualpicker2.isHidden = false
            manuallabel1.isHidden = false
            manuallabel3.isHidden = false
            
            Sharebutton.isHidden = false
            teisyutubutton.isHidden = true
            timepicker.isHidden = true

            
        case 1:
            label.isHidden = true
            reset.isHidden = false
            start.isHidden = false
            stop.isHidden = false
            timerstart.isHidden = true
            timerstop.isHidden = true
            timerLabel.isHidden = true
            stopwatchlabel.isHidden = false
            manualpicker.isHidden = true
            manuallabel.isHidden = true
            manualfield.isHidden = true
            manualpicker2.isHidden = true
            manuallabel1.isHidden = true
            manuallabel3.isHidden = true
            Sharebutton.isHidden = true
            teisyutubutton.isHidden = false
            timepicker.isHidden = true
            
        case 2:
            label.isHidden = true
            reset.isHidden = true
            start.isHidden = true
            stop.isHidden = true
            timerstart.isHidden = false
            timerstop.isHidden = false
            timerLabel.isHidden = false
            stopwatchlabel.isHidden = true
            manualpicker.isHidden = true
            manuallabel.isHidden = true
            manualfield.isHidden = true
            manualpicker2.isHidden = true
            manuallabel1.isHidden = true
            manuallabel3.isHidden = true
            Sharebutton.isHidden = true
            teisyutubutton.isHidden = false
            timepicker.isHidden = false
           
          
        default: break
            
        }
        
        
        
    }
        
        // UIPickerViewのRowが選択された時の挙動
        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {
            
            manuallabel3.text = dataList[row]
            }
            
            
        }
        
        
            

    
    
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */


