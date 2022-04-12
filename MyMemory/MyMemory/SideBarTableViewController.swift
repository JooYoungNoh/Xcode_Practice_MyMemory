//
//  SideBarTableViewController.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/13.
//

import UIKit

class SideBarTableViewController: UITableViewController {
    //목록 데이터 배열
    let titles: [String] = ["새글 작성하기", "친구 새글", "달력으로 보기", "공지사항", "통계", "계정 관리"]
    
    //아이콘 데이터 배열
    let icons = [
        UIImage(named: "icon01"),
        UIImage(named: "icon02"),
        UIImage(named: "icon03"),
        UIImage(named: "icon04"),
        UIImage(named: "icon05"),
        UIImage(named: "icon06"),
    ]
    
    //헤더에 들어갈 레이블 및 이미지 객체 생성
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //테이블 뷰의 헤더 역할을 할 뷰를 정의
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        headerView.backgroundColor = .brown
        
        //테이블 뷰의 헤더 뷰로 지정
        self.tableView.tableHeaderView = headerView
        
        //이름 레이블의 속성 정의 후 헤더 뷰에 추가
        self.nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        self.nameLabel.text = "아이유"
        self.nameLabel.textColor = .white
        self.nameLabel.font = UIFont.systemFont(ofSize: 15)
        self.nameLabel.backgroundColor = .clear
        
        headerView.addSubview(self.nameLabel)
        
        //이메일 레이블의 속성 정의 후 헤더 뷰에 추가
        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 100, height: 30)
        self.emailLabel.text = "sqlpro@naver.com"
        self.emailLabel.textColor = .white
        self.emailLabel.font = UIFont.systemFont(ofSize: 11)
        self.emailLabel.backgroundColor = .clear
        
        headerView.addSubview(self.emailLabel)
        
        //이미지를 구현 후 헤더 뷰에 추가
        let defaultProfile = UIImage(named: "account")
        self.profileImage.image = defaultProfile
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        //이미지를 둥글게 만들기
        self.profileImage.layer.cornerRadius = (self.profileImage.frame.width / 2)                                                              //반원 형태로 라운딩
        self.profileImage.layer.borderWidth = 0                      //테두리 두께 0으로
        self.profileImage.layer.masksToBounds = true                 //마스크 효과
        
        headerView.addSubview(self.profileImage)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //재사용 큐에서 테이블 셀을 꺼내 온다, 없으면 새로 생성
        let identifier = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) ?? UITableViewCell(style: .default, reuseIdentifier: identifier)

        //타이틀과 이미지를 대입
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        //폰트 설정
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {                             //새글 작성 메뉴
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm")
            let target = self.revealViewController().frontViewController as! UINavigationController
            target.pushViewController(uv!, animated: true)
            self.revealViewController().revealToggle(self)  //사이드 바를 닫아주는 메소드
        } else if indexPath.row == 5 {                      //계정 관리 메뉴
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC")
            uv?.modalPresentationStyle = .fullScreen
            self.present(uv!, animated: true){
                self.revealViewController().revealToggle(self)
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
