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
        
        //인자값 없이 CSButton 불러오기 (버튼의 속성을 구현해야 화면에 표시됨)
        let csBtn = CSButton()
        csBtn.frame = CGRect(x: 30, y: 80, width: 150, height: 30)
        self.view.addSubview(csBtn)
        
        //인자값에 따라 다른 스타일로 결정되는 버튼 1
        let rectButton = CSButton(type: .rect)
        rectButton.frame = CGRect(x: 30, y: 150, width: 150, height: 30)
        self.view.addSubview(rectButton)
        
        //인자값에 따라 다른 스타일로 결정되는 버튼 2
        let circleButton = CSButton(type: .circle)
        circleButton.frame = CGRect(x: 200, y: 150, width: 150, height: 30)
        self.view.addSubview(circleButton)
    }


}

