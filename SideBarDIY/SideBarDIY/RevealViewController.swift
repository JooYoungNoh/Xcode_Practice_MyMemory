//
//  RevealViewController.swift
//  SideBarDIY
//
//  Created by 노주영 on 2022/04/12.
//

import UIKit

class RevealViewController: UIViewController {

    var contentVC: UIViewController?           //콘텐츠를 담당할 뷰 컨트롤러
    var sideVC: UIViewController?              //사이드 바 메뉴를 담당할 뷰 컨트롤러
    
    var isSideBarShowing: Bool = false         //현재 사이드 바가 열려있는지 여부
    
    let SLIDE_TIME = 0.3                       //사이드 바가 열리고 닫히는 데 걸리는 시간
    let SIDEBAR_WIDTH: CGFloat = 260           //사이드 바가 열리는 넓이
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //초기 화면 설정 메소드
    func setupView(){
        
    }
    
    //사이드 바의 뷰를 읽어오는 메소드
    func getSideView(){
        
    }
    
    //콘텐츠 뷰에 그림자 효과를 주는 메소드
    func setShadowEffect(shadow: Bool, offset: CGFloat){
        
    }
    
    //사이드 바를 여는 메소드
    func openSideBar(_ complete: ( () -> Void)? ) {
        
    }
    
    //사이드 바를 닫는 메소드
    func closeSideBar(_ complete: ( () -> Void)? ) {
        
    }

}
