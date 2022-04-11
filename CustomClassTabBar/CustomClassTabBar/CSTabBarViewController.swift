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
    
    //액션 메소드
    @objc func onTabBarItemClick(_ sender: UIButton){
        //모든 버튼을 선택되지 않은 상태로 초기화 처리한다
        self.tabItem1.isSelected = false
        self.tabItem2.isSelected = false
        self.tabItem3.isSelected = false
        
        //인자값으로 입력된 버튼만 선택된 상태로 변경한다
        sender.isSelected = true
        
    }
    
    
    //버튼의 공통 속성을 정의하기 위한 메소드
    func addTabBarButton(btn: UIButton, title: String, tag: Int){
        //버튼의 타이틀과 태그값을 입력한다.
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        //버튼의 텍스트 색상을 일반 상태와 선택된 상태로 나누어 설정
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.yellow, for: .selected)
        
        //버튼에 액션 메소드를 연결
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        
        //csView에 버튼 추가
        self.csView.addSubview(btn)
    }
    
    
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
        
        //버튼의 너비와 높이 설정
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBtnHeight = self.csView.frame.height
        
        //버튼의 영역을 차례로 설정
        self.tabItem1.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem2.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem3.frame = CGRect(x: tabBtnWidth * 2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        
        //버튼의 공통 속성을 설정하고, 뷰에 추가
        self.addTabBarButton(btn: self.tabItem1, title: "첫번째 버튼", tag: 0)
        self.addTabBarButton(btn: self.tabItem2, title: "두번째 버튼", tag: 1)
        self.addTabBarButton(btn: self.tabItem3, title: "세번째 버튼", tag: 3)
        
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
