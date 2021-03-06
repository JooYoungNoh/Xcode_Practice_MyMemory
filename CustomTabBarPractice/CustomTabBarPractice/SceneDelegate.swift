//
//  SceneDelegate.swift
//  CustomTabBarPractice
//
//  Created by 노주영 on 2022/04/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        //루트 뷰 컨트롤러를 UITabBarController로 캐스팅
        if let tabBarC = self.window?.rootViewController as? UITabBarController{
            //탭 바에서 탭 바 아이템 배열을 가져온다
            if let tabBarItems = tabBarC.tabBar.items{
                //탭 바 아이템에 커스텀 이미지를 등록한다
                tabBarItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
                tabBarItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tabBarItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                
            //탭 바 아이템 전체를 순회하면서 selectedImage 속성에 이미지를 설정
                for tabBarItem in tabBarItems {
                    let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tabBarItem.selectedImage = image
                    
                   /* //탭 바 아이템별 텍스트 색상 속성을 설정
                    tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
                    tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
                    
                    //전체 아이템의 폰트 크기를 설정
                    tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15)], for: .normal)*/
               }
                
                //외형 프록시 객체를 이용하여 아이템의 타이틀 색상과 폰트 크기를 설정
                let tbItemProxy = UITabBarItem.appearance()
                tbItemProxy.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
                tbItemProxy.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
                tbItemProxy.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15)], for: .normal)
                
                //탭 바 아이템을 타이틀을 설정
                tabBarItems[0].title = "calendar"
                tabBarItems[1].title = "file"
                tabBarItems[2].title = "photo"
            }
         /*   //탭 바 아이템의 이미지 색상을 변경
            tabBarC.tabBar.tintColor = .white               //선택된 탭 바 아이템의 색상
            tabBarC.tabBar.unselectedItemTintColor = .gray  //선택 않된 나머지 탭 바 아이템의 색상
            
            //탭 바에 배경 이미지를 설정
            tabBarC.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")*/
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

