//
//  ViewController.swift
//  InputFormPractice
//
//  Created by 노주영 on 2022/04/08.
//

import UIKit

class ViewController: UIViewController {
    
    //이메일 입력 필드
    var paramEmail: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //네비게이션 바 타이틀을 입력
        self.navigationItem.title = "설정"
        
        // MARK: 이메일 레이블을 생성하고 영역과 문구를 설정
        let emailLabel = UILabel()
        emailLabel.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        emailLabel.text = "이메일"
        
        //레이블의 폰트를 설정
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        
        //레이블을 루트 뷰애 추가
        self.view.addSubview(emailLabel)
        
        // MARK: 자동갱신 레이블을 생성하고 영역과 문구를 설정
        let UpdateLabel = UILabel()
        UpdateLabel.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        UpdateLabel.text = "자동갱신"
        
        //레이블의 폰트를 설정
        UpdateLabel.font = UIFont.systemFont(ofSize: 14)
        
        //레이블을 루트 뷰애 추가
        self.view.addSubview(UpdateLabel)
        
        // MARK: 갱신주기 레이블을 생성하고 영역과 문구를 설정
        let intervalLabel = UILabel()
        intervalLabel.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        intervalLabel.text = "갱신주기"
        
        //레이블의 폰트를 설정
        intervalLabel.font = UIFont.systemFont(ofSize: 14)
        
        //레이블을 루트 뷰애 추가
        self.view.addSubview(intervalLabel)
        
        // MARK: 이메일 입력을 위한 텍스트 필드 추가
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        
        self.view.addSubview(self.paramEmail)
    }


}

