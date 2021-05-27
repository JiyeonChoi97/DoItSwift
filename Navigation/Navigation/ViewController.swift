//
//  ViewController.swift
//  Navigation
//
//  Created by 최지연 on 2021/05/27.
//

import UIKit

class ViewController: UIViewController, EditDelegate { // protocal EditDelegate 상속 -> 상속 받은 경우 프로토콜에서 정의한 함수는 무조건 생성해야함!

    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그웨이 목적지
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{ // 수정 버튼 클릭 시
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton"{ // Edit 버튼 클릭 시
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }

}

