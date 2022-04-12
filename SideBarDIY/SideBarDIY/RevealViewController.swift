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
        //FrontViewController 객체를 읽어온다
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController{
            
            //읽어온 컨트롤러를 클래스 전체에서 참조 할 수 있도록 contentVC 속성에 저장
            self.contentVC = vc
            
            //FrontViewController 객체를 메인 컨트롤러의 자식으로 등록
            self.addChild(vc)                       //메인 컨트롤러의 자식 뷰 컨트롤러로 등록
            self.view.addSubview(vc.view)           //메인 컨트롤러의 서브 뷰로 등록
            
            //FrontController에 부모 뷰 컨트롤러가 바뀌었음을 알려줌
            vc.didMove(toParent: self)
        }
        
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
