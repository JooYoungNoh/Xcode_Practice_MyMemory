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

        self.setupView()
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
        guard self.sideVC == nil else { return }
        
        //사이드 바 컨트롤러 객체를 읽어온다
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") else { return }
        
        //다른 메소드에서도 참조 할 수 있도록 sideVC 속성에 저장
        self.sideVC = vc
        
        //읽어온 사이드 바 컨트롤러 객체를 컨테이너 뷰 컨트롤러에 연결
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        //프론트 컨트롤러에 부모 뷰 컨트롤러가 바뀌었음을 알려준다
        vc.didMove(toParent: self)
        
        //프론트 컨트롤러의 뷰를 제일 위로 올린다
        self.view.bringSubviewToFront((self.contentVC?.view)!)
    }
    
    //콘텐츠 뷰에 그림자 효과를 주는 메소드
    func setShadowEffect(shadow: Bool, offset: CGFloat){
        //그림자 효과 설정
        if (shadow == true) {
            self.contentVC?.view.layer.masksToBounds = false
            self.contentVC?.view.layer.cornerRadius = 10            //그림자 모서리 둥글기
            self.contentVC?.view.layer.shadowOpacity = 0.8          //그림자 투명도
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset)
        } else {
            self.contentVC?.view.layer.cornerRadius = 0.0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    //사이드 바를 여는 메소드
    func openSideBar(_ complete: ( () -> Void)? ) {
        //앞에서 정의했던 메소드들을 실행
        self.getSideView()
        self.setShadowEffect(shadow: true, offset: -2)
        
        //애니메이션 옵션 및 실행
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME), delay: TimeInterval(0), options: options, animations: {
            self.contentVC?.view.frame = CGRect(x: self.SIDEBAR_WIDTH, y: 0, width: self.view.frame.width, height: self.view.frame.height)}, completion: {
                if $0 == true {
                    self.isSideBarShowing = true            //열린 상태로 플래그를 변경
                    complete?()
                }
            })
    }
    
    //사이드 바를 닫는 메소드
    func closeSideBar(_ complete: ( () -> Void)? ) {
        
    }

}
