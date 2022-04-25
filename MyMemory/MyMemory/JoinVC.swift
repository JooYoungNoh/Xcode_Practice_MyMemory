//
//  JoinVC.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/26.
//

import UIKit
import Alamofire

class JoinVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    //테이블 뷰에 들어갈 텍스트 필드들
    var fieldAccount: UITextField!
    var fieldPassword: UITextField!
    var fieldName: UITextField!
    
    //API 호출 상태값을 관리할 변수
    var isCalling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //프로필 이미지를 원형으로 설정
        self.profile.layer.cornerRadius = self.profile.frame.width / 2
        self.profile.layer.masksToBounds = true
        
        //프로필 이미지에 탭 제스처 및 액션 이벤트 설정
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedProfile(_:)))
        self.profile.addGestureRecognizer(gesture)
        
        //인디케이터 뷰를 화면 맨 앞으로
        self.view.bringSubviewToFront(self.indicatorView)
    }
    
    //MARK: 테이블 뷰 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        //각 테이블 뷰 셀 모두에 공통으로 적용될 프레임 객체
        let tframe = CGRect(x: 20, y: 0, width: cell.bounds.width - 20, height: 37)
        switch indexPath.row{
        case 0 :
            self.fieldAccount = UITextField(frame: tframe)
            self.fieldAccount.placeholder = "계정(이메일)"
            self.fieldAccount.borderStyle = .none
            self.fieldAccount.autocapitalizationType = .none
            self.fieldAccount.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldAccount)
        case 1 :
            self.fieldPassword = UITextField(frame: tframe)
            self.fieldPassword.placeholder = "비밀번호"
            self.fieldPassword.borderStyle = .none
            self.fieldPassword.isSecureTextEntry = true
            self.fieldPassword.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldPassword)
        case 2 :
            self.fieldName = UITextField(frame: tframe)
            self.fieldName.placeholder = "이름"
            self.fieldName.borderStyle = .none
            self.fieldName.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldName)
        default :
            ()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    //MARK: 이미지 피커 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let rawVal = UIImagePickerController.InfoKey.originalImage.rawValue
        if let img = info[UIImagePickerController.InfoKey(rawValue: rawVal)] as? UIImage{
            self.profile.image = img
        }
        self.dismiss(animated: true)
    }

    //MARK: 아울렛 메소드
    @IBAction func submit(_ sender: Any){
        if self.isCalling == true {
            self.alert("진행 중입니다. 잠시만 기다려주세요.")
            return
        } else {
            self.isCalling = true
        }
        
        //인디케이터 뷰 애니메이션 시작
        self.indicatorView.startAnimating()
        
        //전달할 값 준비
        //이미지를 Base64 인코딩 처리
        let profile = self.profile.image!.pngData()?.base64EncodedString()
        //전달값을 Parameters 타입의 객체로 정의
        let param: Parameters = [
            "account" : self.fieldAccount.text!,
            "passwd" : self.fieldPassword.text!,
            "name" : self.fieldName.text!,
            "profile_imagee" : profile!
        ]
        
        //API 호출
        let url = "http://swiftapi.rubypaper.co.kr:2029/userAccount/join"
        let call = AF.request(url, method: HTTPMethod.post, parameters: param, encoding: JSONEncoding.default)
        
        //서버 응답값 처리
        call.responseJSON { res in
            //인디케이터 뷰 애니메이션 종료
            self.indicatorView.stopAnimating()
            
            //JSON 형식으로 값이 제대로 전달되었는지 확인
            guard let jsonObject = try! res.result.get() as? [String: Any] else{
                self.isCalling = false
                self.alert("서버 호출 과정에서 오류가 발생했습니다")
                return
            }
            //응답 코드 확인, 0이면 성공
            let resultCode = jsonObject["result_code"] as! Int
            if resultCode == 0{
                self.alert("가입이 완료되었습니다.")
            } else {
                self.isCalling = false
                let errorMsg = jsonObject["error_msg"] as! String
                self.alert("오류 발생 : \(errorMsg)")
            }
        }
        
    }
    
    //MARK: 액션 메소드
    @objc func tappedProfile(_ sender: Any){
        //원하는 소스 타입을 선택 할 수 있는 액션 시트 구현
        let msg = "프로필 이미지를 읽어올 곳을 선택하세요."
        let sheet = UIAlertController(title: msg, message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        sheet.addAction(UIAlertAction(title: "저장된 앨범", style: .default){ (_) in
            self.selectLibrary(src: .savedPhotosAlbum)
        })
        sheet.addAction(UIAlertAction(title: "포토 라이브러리", style: .default){ (_) in
            self.selectLibrary(src: .photoLibrary)
        })
        sheet.addAction(UIAlertAction(title: "카메라", style: .default){ (_) in
            self.selectLibrary(src: .camera)            //시뮬레이터 불가
        })
        self.present(sheet, animated: false)
    }
    
    //MARK: 메소드들
    //소스타입에 맞게 이미지 피커를 여는 메소드
    func selectLibrary(src: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(src){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            
            self.present(picker, animated: false)
        } else {
            self.alert("사용할 수 없는 타입입니다.")
        }
    }
}
