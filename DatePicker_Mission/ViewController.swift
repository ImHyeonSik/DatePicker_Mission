//
//  ViewController.swift
//  DatePicker_Mission
//
//  Created by hyeonsik on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {
    // 타이머가 구동되면 실행할 함수를 지정
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let colorSelector: Selector = #selector(ViewController.updateColor)
    let interval = 1.0
    let oneMin = 10.0
    var count = 0
    var alarmTime : String?
    var alertState = false

    
    @IBOutlet var nowTimeLabel: UILabel!
    
    @IBOutlet var selectTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        selectTimeLabel.text = "선택된 시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime() {
//        nowTimeLabel.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        nowTimeLabel.text = "현재시간 : " + formatter.string(from: date as Date)
    
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        if (currentTime == alarmTime) {
            // 알람 시간이 되면 배경색 red, 10초 후 배경색 white
//            view.backgroundColor = UIColor.red
//            Timer.scheduledTimer(timeInterval: oneMin, target: self, selector: colorSelector, userInfo: nil, repeats: false)
            // 알람 시간이 되면 alert 창 띄우기
            if !alertState {
                let alertPop = UIAlertController(title: "알림", message: "설정된 시간 입니다!!!", preferredStyle: UIAlertController.Style.alert)
                let ok = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                alertPop.addAction(ok)
                present(alertPop, animated: true, completion: nil)
                alertState = true
            }
            else {
                alertState = false
            }
        }
    }
    
    @objc func updateColor() {
        
        view.backgroundColor = UIColor.white
    }
    
}

