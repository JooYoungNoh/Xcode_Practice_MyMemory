//
//  MemoFormViewController.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/07.
//

import UIKit

class MemoFormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var subject: String!        //제목을 저장할 객체
    
    @IBOutlet weak var contentsView: UITextView!
    @IBOutlet weak var preview: UIImageView!
    
    @IBAction func save(_ sender: UIBarButtonItem){
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
