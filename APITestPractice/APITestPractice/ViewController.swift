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
        //전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)"
        let paramData = param.data(using: .utf8)
        
        //URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        
        //URLRequest 객체를 정의하고 요청 내용을 담는다
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        //HTTP 메시지 헤더 설정
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        //URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
            //서버가 응답이 없거나 통신이 실패 했을 때
            if let e = error{
                NSLog("An Error has occurred : \(e.localizedDescription)")
                return
            }
            //응답 처리 로직
            DispatchQueue.main.async {
                do{
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    //JSON 결과값 추출
                    let result = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    //결과가 성공일 때만 텍스트 뷰에 출력
                    if result == "SUCCESS" {
                        self.responseView.text =
                        "아이디 : \(userId!)" + "\n" +
                        "이름 : \(name!)" + "\n" +
                        "응답결과 : \(result!)" + "\n" +
                        "응답시간 : \(timestamp!)" + "\n" +
                        "요청방식 : x-www-form-urlencoded"
                    }
                } catch let error as NSError{
                    print("An error has occuredd while parsing JSONObject : \(error.localizedDescription)")
                }
            }
            
        }
        // POST 전송
        task.resume()
    }


}

