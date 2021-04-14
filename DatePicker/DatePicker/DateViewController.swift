//
//  ViewController.swift
//  DatePicker
//
//  Created by 최지연 on 2021/02/22.
//

// 타이머 기능을 사용하여 1초에 한번씩 현재시간 출력
// datepicker로 선택한 시간 선택시간에 출력

import UIKit

class DateViewController: UIViewController {
    let timeSelector : Selector = #selector(DateViewController.updateTime)
    let interval = 1.0 // 타이머의 간격 (1.0 = 1초)
    var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datepickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // 년-월-일 분:초 요일
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datepickerView.date)
    }
    
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
}

