//
//  CSTabBarViewController.swift
//  CustomClassTabBar
//
//  Created by 노주영 on 2022/04/12.
//

import UIKit

class CSTabBarViewController: UITabBarController {

    let csView = UIView()
    let tabItem1 = UIButton(type: .system)
    let tabItem2 = UIButton(type: .system)
    let tabItem3 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //기존 탭 바를 숨김 처리
        self.tabBar.isHidden = true
        
        //새로운 탭 바 역할을 할 뷰를 위해 기준 좌표와 크기를 정의
        let width = self.view.frame.width
        let height: CGFloat = 50
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        
        //정의된 값을 이용하여 새로운 뷰의 속성을 설정
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = .brown
        
        self.view.addSubview(self.csView)
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
