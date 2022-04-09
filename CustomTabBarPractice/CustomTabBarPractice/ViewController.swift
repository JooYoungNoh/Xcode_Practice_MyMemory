//
//  ViewController.swift
//  CustomTabBarPractice
//
//  Created by 노주영 on 2022/04/09.
//

import UIKit

class ViewController: UIViewController {

    //탭 바 숨기기를 위한 메소드
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
      //  tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        UIView.animate(withDuration: TimeInterval(0.15)){
            //alpha값이 0이면 1로, 1이면 0으로 바꾼다
            //호출될 때마다 점점 투명해졌다가 점점 진해진다
            tabBar?.alpha = (tabBar?.alpha == 0) ? 1 : 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: title 레이블 생성
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

