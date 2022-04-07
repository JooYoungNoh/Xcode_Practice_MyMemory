//
//  ReadViewController.swift
//  InputFormPractice
//
//  Created by 노주영 on 2022/04/08.
//

import UIKit

class ReadViewController: UIViewController {
    //전달된 값을 저장할 변수 정의
    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //배경 색상 설정
        self.view.backgroundColor = .white
        
        //레이블 객체 정의
        let email = UILabel()
        let update = UILabel()
        let interval = UILabel()
        
        //레이블 객체 Frame 설정
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        update.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        interval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        //전달받은 값 레이블에 표시
        email.text = "전달받은 이메일 : \(self.pEmail!)"
        update.text = "업데이트 여부 : \(self.pUpdate == true ? "업데이트 함" : "업데이트 안함")"
        interval.text = "업데이트 주기 : \(self.pInterval!)분마다"
        
        //레이블을 루트 뷰에 추가
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
