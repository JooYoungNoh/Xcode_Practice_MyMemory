//
//  SecondViewController.swift
//  CustomTabBarPractice
//
//  Created by 노주영 on 2022/04/09.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK: title 레이블 생성
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        //title 레이블 속성 설정
        title.text = "두번째 탭"
        title.textColor = .red
        title.textAlignment = .center       //중앙 정렬
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        //콘텐츠 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        
        //X축의 중앙에 오도록 설정
        title.center.x = self.view.frame.width / 2
        
        //뷰에 추가
        self.view.addSubview(title)
        
        // MARK: 탭 바 아이템에 커스텀 이미지를 등록하고 탭 이름을 입력
        self.tabBarItem.image = UIImage(named: "photo.png")
        self.tabBarItem.title = "photo"
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
