//
//  ProfileViewController.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/13.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let profileImage = UIImageView()            //프로필 사진 이미지
    let tv = UITableView()                      //프로필 목록
    
    //뒤로 가는 메소드
    @objc func close(_ sender: Any){
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "프로필"
        
        //뒤로가기 버튼
        let backButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    // MARK: 테이블 뷰 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
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
