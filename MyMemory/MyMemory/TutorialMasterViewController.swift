//
//  TutorialMasterViewController.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/15.
//

import UIKit

class TutorialMasterViewController: UIViewController, UIPageViewControllerDataSource {
    var pageVC: UIPageViewController!
    
    //콘텐츠 뷰 컨트롤러에 들어갈 타이틀과 이미지
    var contentTitles = ["STEP 1", "STEP 2", "STEP 3", "STEP 4"]
    var contentImages = ["page0", "page1", "page2", "page3"]
    
    @IBAction func close(_ sender: Any){
        let ud = UserDefaults.standard
        ud.set(true, forKey: UserInfoKey.tutorial)
        ud.synchronize()
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func getContentVC(atIndex idx: Int) -> UIViewController? {
        //인덱스가 데이터 배열 크기 범위를 벗어나면 nil 반환
        guard self.contentTitles.count >= idx && self.contentTitles.count > 0 else { return nil }
        
        //"ContentsVC"라는 스토리보드 ID를 가진 뷰 컨트롤러의 인스턴스를 생성하고 캐스팅
        guard let cvc = self.instanceTutorialVC(name: "ContentsVC") as? TutorialContentsViewController else { return nil }
        
        //콘텐츠 뷰 컨트롤러의 내용 구성
        cvc.titleText = self.contentTitles[idx]
        cvc.imageFile = self.contentImages[idx]
        cvc.pageIndex = idx
        return cvc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //현재의 페이지 인덱스
        guard var index = (viewController as! TutorialContentsViewController).pageIndex else { return nil }
        
        //현재의 인덱스가 맨 앞이라면 nil을 반환하고 종료
        guard index > 0 else { return nil }
        
        index -= 1                  //이전 페이지 인덱스
        return self.getContentVC(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //현재의 페이지 인덱스
        guard var index = (viewController as! TutorialContentsViewController).pageIndex else { return nil }
        
        index += 1                  //다음 페이지 인덱스
        
        //인덱스는 항상 배열 데이터의 크기보다 작아야됨
        guard index < self.contentTitles.count else { return nil }
        
        return self.getContentVC(atIndex: index)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //페이지 뷰 컨트롤러 객체 생성
        self.pageVC = self.instanceTutorialVC(name: "PageVC") as? UIPageViewController
        self.pageVC.dataSource = self
        
        //페이지 뷰 컨트롤러의 기본 페이지 설정
        let startContentVC = self.getContentVC(atIndex: 0)!
        self.pageVC.setViewControllers([startContentVC], direction: .forward, animated: true)
        
        //페이지 뷰 컨트롤러의 출력 영역 지정
        self.pageVC.view.frame.origin = CGPoint(x: 0, y: 0)
        self.pageVC.view.frame.size.width = self.view.frame.width
        self.pageVC.view.frame.size.height = self.view.frame.height - 80
        
        //페이지 뷰 컨트롤러를 마스터 뷰 컨트롤러의 자식 뷰 컨트롤러로 설정
        self.addChild(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMove(toParent: self)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.contentTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
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
