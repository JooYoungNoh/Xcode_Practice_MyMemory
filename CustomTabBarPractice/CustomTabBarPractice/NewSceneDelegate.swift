//
//  NewSceneDelegate.swift
//  CustomTabBarPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit

class NewSceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //탭 바 컨트롤러를 생성하고, 배경을 흰색으로 채운다
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        //tbC를 루트 뷰 컨트롤러로 등록한다
        self.window?.rootViewController = tbC
        
        //탭 바 아이템에 연결될 뷰 컨트롤러 객체를 생성한다
        let view1 = ViewController()
        let view2 = SecondViewController()
        let view3 = ThirdViewController()
        
        //생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록한다
        tbC.setViewControllers([view1, view2, view3], animated: false)
        
        //개별 탭 바 아이템 속성을 설정한다
        view1.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view2.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view3.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
    }
}
