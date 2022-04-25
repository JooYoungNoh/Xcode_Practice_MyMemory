//
//  ViewController.swift
//  APITestPractice
//
//  Created by 노주영 on 2022/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var responseView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callCurrentTime(_ sender: UIButton){
        do{
            //URL 설정 및 GET 방식으로 API 호출
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            
            //읽어온 값을 레이블에 표시
            self.currentTime.text = response
            self.currentTime.sizeToFit()
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func post(_ sender: UIButton){
        
    }


}

