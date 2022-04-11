//
//  MemoFormViewController.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/07.
//

import UIKit

class MemoFormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    var subject: String!        //제목을 저장할 객체
    
    @IBOutlet weak var contentsView: UITextView!
    @IBOutlet weak var preview: UIImageView!
    
    // MARK: 저장 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func save(_ sender: UIBarButtonItem){
        //내용을 입력하지 않는 경우 경고
        guard self.contentsView.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: false)
            return
        }
        //MemoData 객체를 생성하고, 데이터를 담는다.
        let data = MemoData()
        
        data.title = self.subject                   //제목
        data.contents = self.contentsView.text      //내용
        data.image = self.preview.image             //이미지
        data.regdate = Date()                       //작성 시각
        
        //앱 델리게이트 객체를 읽어온 다음, memolist 배열에 MemoData 객체를 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        //작성폼 화면을 종료하고 이전 화면으로 되돌아간다.
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //사용자가 텍스트 뷰에 뭔가를 입력하면 자동으로 호출되는 메소드
    func textViewDidChange(_ textView: UITextView) {
        //내용을 최대 15자리까지 읽어 subject 변수에 저장
        let contents = textView.text as NSString
        let length = ((contents.length>15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        // 네비게이션 타이틀에 표시
        self.navigationItem.title = self.subject
    }
    
    // MARK: 카메라 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func pick(_ sender: UIBarButtonItem){
        
        //이미지 피커 인스턴스를 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true     //이미지 편집 허용
        
        //이미지 피커 화면을 표시
        self.present(picker, animated: false)
        
    }
    
    //사용자가 이미지를 선택하면 자동으로 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //선택된 이미지를 미리보기에 출력
        self.preview.image = info[.editedImage] as? UIImage
        
        //이미지 피커 컨트롤러를 닫는다
        picker.dismiss(animated: false)
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsView.delegate = self       //텍스트뷰 델리게이트 정의

        //배경 이미지 설정
        let bgImage = UIImage(named: "memo-background")!
        self.view.backgroundColor = UIColor(patternImage: bgImage)
        
        //텍스트 뷰의 기본 속성
        self.contentsView.layer.borderWidth = 0
        self.contentsView.layer.borderColor = UIColor.clear.cgColor
        self.contentsView.backgroundColor = UIColor.clear
        
        //줄 간격
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 9
        self.contentsView.attributedText = NSAttributedString(string: " ", attributes: [.paragraphStyle: style])
        self.contentsView.text = ""
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
