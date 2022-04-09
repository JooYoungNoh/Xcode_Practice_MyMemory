//
//  MapAlertViewController.swift
//  CustomAlertPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit
import MapKit

class MapAlertViewController: UIViewController {

    //버튼 액션 메소드
    @objc func mapAlert(_ sender: UIButton){
        //경고창 객체를 생성하고, OK 및 Cancel 버튼을 추가
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        //콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성하고, 알림창에 등록한다
        let contentVC = UIViewController()
        
        //뷰 컨트롤러에 맵킷 뷰를 추가
        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        contentVC.view = mapkitView
        
        //뷰 컨트롤러를 알림창의 콘텐츠 뷰 컨트롤러 속성에 등록한다
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //버튼 생성
        let alertButton = UIButton(type: .system)
        
        //버튼 속성 설정
        alertButton.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertButton.center.x = self.view.frame.width / 2
        alertButton.setTitle("Map Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(alertButton)
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
