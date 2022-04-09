//
//  ImageViewController.swift
//  CustomAlertPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //이미지와 이미지 뷰 객체를 생성
        let icon = UIImage(named: "rating5")
        let iconview = UIImageView(image: icon)
        
        //이미지 뷰의 영역과 위치 설정
        iconview.frame = CGRect(x: 0, y: 0, width: (icon?.size.width)!, height: (icon?.size.height)!)
        
        //루트 뷰에 이미지 뷰를 추가
        self.view.addSubview(iconview)
        
        //외부에서 참조할 뷰 컨트롤러 사이즈를 이미지 크기와 동일하게 설정
        self.preferredContentSize = CGSize(width: (icon?.size.width)!, height: (icon?.size.height)! + 10)
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
