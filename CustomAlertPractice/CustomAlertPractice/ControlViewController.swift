//
//  ControlViewController.swift
//  CustomAlertPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit

class ControlViewController: UIViewController {
    //슬라이더 객체를 정의
    let slider = UISlider()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //슬라이더의 최소값 / 최대값 설정
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        
        // 슬라이더의 영역과 크기를 정의하고 루트 뷰에 추가
        self.slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview((self.slider))
        
        //뷰 컨트롤러의 콘텐츠 사이즈를 지정
        self.preferredContentSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height + 10)
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
