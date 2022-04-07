//
//  ViewController.swift
//  CustomButtonPractice
//
//  Created by 노주영 on 2022/04/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //버튼 객체를 생성하고, 속정을 설정
        let btn = UIButton(type: .system)       //버튼의 타입을 인자값으로 하여 버튼 인스턴스 생성
        btn.frame = CGRect(x:50, y: 100, width: 150, height: 30)       //버튼의 영역을 설정하여                                                               frame 속성에 대입
        btn.setTitle("테스트 버튼", for: .normal)     //setTilte(_:for:) 메소드를 이용하여 타이틀 설정
        
        //버튼을 수평 중앙 정렬한다(Center구문은 버튼 CGRect구문 밑에 있어야한다
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        //루트 뷰에 버튼을 추가한다
        self.view.addSubview(btn)
    }


}

