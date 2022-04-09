//
//  MapAlertViewController.swift
//  CustomAlertPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit
import MapKit

class MapAlertViewController: UIViewController {

    // MARK: 지도 버튼 액션 메소드
    @objc func mapAlert(_ sender: UIButton){
        //경고창 객체를 생성하고, OK 및 Cancel 버튼을 추가
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        //콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성하고, 알림창에 등록한다
        let contentVC = MapKitViewController()
        
        //뷰 컨트롤러를 알림창의 콘텐츠 뷰 컨트롤러 속성에 등록한다
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    // MARK: 이미지 버튼 액션 메소드
    @objc func imageAlert(_ sender: UIButton){
        //경고창 객체를 생성하고, OK 버튼을 추가한다
        let alert = UIAlertController(title: nil, message: "이번 글의 평점은 다음과 같습니다", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        //콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성하고, 알림창에 등록
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    // MARK: 슬라이더 버튼 액션 메소드
    @objc func sliderAlert(_ sender: UIButton){
        //콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러 생성
        let contentVC = ControlViewController()
        
        //경고창 객체 생성, OK 버튼 추가
        let alert = UIAlertController(title: nil, message: "이번 글의 평점을 입력해주세용", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){ (_) in
            print(">>>sliderValue = \(contentVC.sliderValue)")
        }
        
        alert.addAction(okAction)
        
        //컨트롤 뷰 컨트롤러를 알림창에 등록
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //지도 알림창 버튼 생성
        let alertButton = UIButton(type: .system)
        
        //지도 알림창버튼 속성 설정
        alertButton.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertButton.center.x = self.view.frame.width / 2
        alertButton.setTitle("Map Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(alertButton)
        
        //이미지 알림창 버튼 생성
        let imageButton = UIButton(type: .system)
        imageButton.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageButton.center.x = self.view.frame.width / 2
        imageButton.setTitle("Image Alert", for: .normal)
        imageButton.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview((imageButton))
        
        //슬라이더 알림창 버튼 생성
        let sliderButton = UIButton(type: .system)
        sliderButton.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        sliderButton.center.x = self.view.frame.width / 2
        sliderButton.setTitle("Slider Alert", for: .normal)
        sliderButton.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(sliderButton)
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
