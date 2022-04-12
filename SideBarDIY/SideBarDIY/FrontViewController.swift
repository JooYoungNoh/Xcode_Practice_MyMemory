//
//  FrontViewController.swift
//  SideBarDIY
//
//  Created by 노주영 on 2022/04/12.
//

import UIKit

class FrontViewController: UIViewController {
    //사이드 바 오픈 기능을 위임할 델리게이트
    var delegate: RevealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //사이드 바 오픈용 버튼 정의
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveSide(_:)))
        
        //버튼을 내바게이션 바의 왼쪽영역에 추가
        self.navigationItem.leftBarButtonItem = btnSideBar
    }
    
    //사용자 액션에 따라 델리게이트 메소드를 호출
    @objc func moveSide(_ sender: Any){
        if self.delegate?.isSideBarShowing == false {
            self.delegate?.openSideBar(nil)                 //사이드 바를 연다
        } else {
            self.delegate?.closeSideBar(nil)                //사이드 바를 닫는다
        }
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
