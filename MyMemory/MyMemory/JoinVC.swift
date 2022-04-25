//
//  JoinVC.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/26.
//

import UIKit
import Alamofire

class JoinVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //테이블 뷰에 들어갈 텍스트 필드들
    var fieldAccount: UITextField!
    var fieldPassword: UITextField!
    var fieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: 테이블 뷰 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    //MARK: 아울렛 메소드
    @IBAction func submit(_ sender: Any){
        
    }
}
