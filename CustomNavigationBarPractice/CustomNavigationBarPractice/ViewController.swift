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
        
        //self.initTitle()      //기본 네비게이션
        // self.initTitleNew()     //복합적인 네비게이션
        self.initTitleImage()
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
        navigationTitle.textColor = UIColor.white
        
        //네비게이션 타이틀에 입력
        self.navigationItem.titleView = navigationTitle
        
        //배경 색상 설정
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    // MARK: 복합적인 네비게이션 바 함수
    func initTitleNew(){
        //복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        //상단 레이블 정의
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "58개 숙소"
        
        //하단 레이블 정의
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = .white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        //상하단 레이블을 컨테이너 뷰에 추가한다
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        //네비게이션 타이틀에 컨테이너 뷰를 연결한다
        self.navigationItem.titleView = containerView
        
        //배경 색상 설정
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.isTranslucent = false   //반투명(안하면 색 안나옴
    }

    // MARK: 타이틀에 이미지를 표시하는 함수
    func initTitleImage(){
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        
        self.navigationItem.titleView = imageV
    }
}

