//
//  ViewController.swift
//  CustomClassButtonPractice
//
//  Created by 노주영 on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //코드로 버튼 생성
        let frame = CGRect(x: 30, y: 50, width: 150, height: 30)
        let csButton = CSButton(frame: frame)
        self.view.addSubview(csButton)
    }


}

