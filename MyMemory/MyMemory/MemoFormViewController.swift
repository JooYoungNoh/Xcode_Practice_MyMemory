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
    
    @IBAction func pick(_ sender: UIBarButtonItem){
        
        
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
