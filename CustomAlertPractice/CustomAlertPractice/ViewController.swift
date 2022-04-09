//
//  ViewController.swift
//  CustomAlertPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit

class ViewController: UIViewController {

    // MARK: 버튼 액션 이벤트
    @objc func defaultAlert(_ sender: UIButton){
        //알림창을 정의
        let alert = UIAlertController(title: "알림창", message: "기본 메시지가 들어가는 곳", preferredStyle: .alert)
        
        // 버튼을 정의
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        //버튼을 알림창에 추가
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        //알림창에 들어갈 뷰 컨트롤러
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        
        //알림창에 뷰 컨트롤러 등록
        alert.setValue(vc, forKey: "contentViewController")
        
        //알림창을 화면에 표시
        self.present(alert, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //기본 알림창 버튼 생성
        let defaultAlertButton =  UIButton(type: .system)
        defaultAlertButton.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertButton.center.x = self.view.frame.width / 2
        defaultAlertButton.setTitle(("기본 알림창"), for: .normal)
        defaultAlertButton.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        self.view.addSubview((defaultAlertButton))
    }


}

