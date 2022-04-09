//
//  ViewController.swift
//  CustomNavigationBarPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.initTitle()
    }

    // MARK: 네비게이션 기능 함수
    func initTitle(){
        //네비게이션 타이틀 레이블 객체
        let navigationTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        //속성 설정
        navigationTitle.numberOfLines = 2
        navigationTitle.textAlignment = .center
        navigationTitle.font = UIFont.systemFont(ofSize: 15)
        navigationTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        
        //네비게이션 타이틀에 입력
        self.navigationItem.titleView = navigationTitle
    }

}

