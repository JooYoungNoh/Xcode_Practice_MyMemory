//
//  ViewController.swift
//  CustomClassStamperPractice
//
//  Created by 노주영 on 2022/04/12.
//

import UIKit

class ViewController: UIViewController {

    @objc func logging(_ sender: CSStepper){
        print("현재 스테퍼의 값은 \(sender.value)입니다")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //CSStempper 객체 정의
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        
        //ValueChanged 이벤트가 발생하면 발생할 액션 메소드 연결
        stepper.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        self.view.addSubview(stepper)
    }


}

