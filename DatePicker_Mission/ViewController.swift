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
            view.backgroundColor = UIColor.red
            Timer.scheduledTimer(timeInterval: oneMin, target: self, selector: colorSelector, userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateColor() {
        
        view.backgroundColor = UIColor.white
    }
    
}

