//
//  DepartmentInfoTableViewController.swift
//  HRPractice
//
//  Created by 노주영 on 2022/04/20.
//

import UIKit

class DepartmentInfoTableViewController: UITableViewController {
    //부서 정보를 저장할 데이터 타입
    typealias DepartRecord = (departCd: Int, departTitle: String, departAddr: String)
    
    var departCd: Int!                      //부서 목록으로부터 넘겨 받을 부서 코드
    let departDAO = DepartmentDAO()         //부서 DAO 객체
    let empDAO = EmployeeDAO()              //사원 DAO 객체
    var departInfo: DepartRecord!           //부서 정보를 담을 변수
    var empList: [EmployeeVO]!              //사원 정보를 담을 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.departInfo = self.departDAO.get(departCd: self.departCd)
        self.empList = self.empDAO.find(departCd: self.departCd)
        self.navigationItem.title = "\(self.departInfo.departTitle)"
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

}
