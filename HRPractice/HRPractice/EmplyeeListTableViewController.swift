//
//  EmplyeeListTableViewController.swift
//  HRPractice
//
//  Created by 노주영 on 2022/04/20.
//

import UIKit

class EmplyeeListTableViewController: UITableViewController {
    //데이터 소스를 저장할 변수
    var empList: [EmployeeVO]!
    //SQLite 처리를 담당할 DAO 클래스
    var empDAO = EmployeeVO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.empList = self.empDAO.find()
        self.initUI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    //MARK: 메소드들
    //UI초기화 함수
    func initUI(){
        //내비게이션 타이틀용 레이블 속성 설정
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "사원 목록 \n" + "총 \(self.empList.count) 명"
        
        self.navigationItem.titleView = navTitle
    }
}
