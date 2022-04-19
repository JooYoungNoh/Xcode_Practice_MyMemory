//
//  DepartmentListTableViewController.swift
//  HRPractice
//
//  Created by 노주영 on 2022/04/20.
//

import UIKit

class DepartmentListTableViewController: UITableViewController {
    //데이트 소스용 멤버 변수
    var departList: [(departCd: Int, departTitle: String, departAddr: String)]!
    
    let departDAO = DepartmentDAO()                     //SQLite 처리를 담당할 DAO 객체
    override func viewDidLoad() {
        super.viewDidLoad()
        self.departList = self.departDAO.find()         //기존 저장된 부서 정보를 가져온다
        self.initUI()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.departList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //indexPath 매개변수가 가르키는 행에 대한 데이터를 읽어온다
        let rowData = self.departList[indexPath.row]
        
        //셀 객체를 생성하고 데이터를 배치
        let cell = tableView.dequeueReusableCell(withIdentifier: "DEPART_CELL")
        
        cell?.textLabel?.text = rowData.departTitle
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        cell?.detailTextLabel?.text = rowData.departAddr
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        
        return cell!
    }
    
    //MARK: 아울렛 액션 메소드
    //신규 부서를 추가하는 메소드
    @IBAction func add(_sender: Any){
        let alert = UIAlertController(title: "신규 부서 등록", message: "신규 부서를 등록해주세요", preferredStyle: .alert)
        
        //부서명 및 주소 입력용 텍스트 필드 추가
        alert.addTextField() { (tf) in tf.placeholder = "부서명" }
        alert.addTextField() { (tf) in tf.placeholder = "주소" }
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default){ (_) in
            
            let title = alert.textFields?[0].text       //부서명
            let addr = alert.textFields?[1].text        //부서 주소
            
            //신규 부서가 등록되면 DB에서 목록을 다시 읽어온 후, 테이블을 갱신
            if self.departDAO.create(title: title!, addr: addr!){
                self.departList = self.departDAO.find()
                self.tableView.reloadData()
                
                //내비게이션 타이들에도 변경된 부서 정보를 반영
                let navTitle = self.navigationItem.titleView as! UILabel
                navTitle.text = "부서 목록 \n" + "총 \(self.departList.count) 개"
            }
        })
        self.present(alert, animated: false)
    }

    //MARK: 메소드들
    //UI 초기화 함수
    func initUI() {
        //네비게이션 타이틀용 레이블 속성 설정
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "부서 목록 \n" + "총 \(self.departList.count) 개"
        
        //내비게이션 바 UI 설정
        self.navigationItem.titleView = navTitle
        self.navigationItem.leftBarButtonItem = self.editButtonItem     //편집 버튼 추가
        
        //셀을 스와이프했을 때 편집 모드가 되도록 설정
        self.tableView.allowsSelectionDuringEditing = true
    }
}
