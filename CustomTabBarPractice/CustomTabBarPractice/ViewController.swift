//
//  ViewController.swift
//  CustomTabBarPractice
//
//  Created by 노주영 on 2022/04/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //title 레이블 생성
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        //title 레이블 속성 설정
        title.text = "첫번째 탭"
        title.textColor = .red
        title.textAlignment = .center       //중앙 정렬
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        //콘텐츠 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        
        //X축의 중앙에 오도록 설정
        title.center.x = self.view.frame.width / 2
        
        //뷰에 추가
        self.view.addSubview(title)
    }


}

