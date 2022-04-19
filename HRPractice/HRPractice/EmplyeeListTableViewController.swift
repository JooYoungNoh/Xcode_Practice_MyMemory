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
    var empDAO = EmployeeDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.empList = self.empDAO.find()
        self.initUI()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.empList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = self.empList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EMP_CELL")
        
        //사원명 + 재직 상태 출력
        cell?.textLabel?.text = rowData.empName + "(\(rowData.stateCd.desc()))"
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        cell?.detailTextLabel?.text = rowData.departTitle
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell!
    }
    //MARK: 아웃렛 액션 메소드
    //사원 등록 메소드
    @IBAction func add(_ sender: Any){
        let alert = UIAlertController(title: "사원 등록", message: "등록할 사원의 정보를 입력해주세요", preferredStyle: .alert)
        
        alert.addTextField(){ (tf) in tf.placeholder = "사원명" }
        
        //contentViewController 영역에 부서 선택 피커 뷰 삽입
        let pickerVC = DepartPickerViewController()
        alert.setValue(pickerVC, forKey: "contentViewController")
        
        //등록창 버튼 처리
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default){ () in
            //알림창의 입력필드에서 값을 읽어온다
            var param = EmployeeVO()
            param.departCd = pickerVC.selectedDepartCd
            param.empName = (alert.textFields?[0].text)!
            
            //가입일은 오늘로 한다
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            param.joinDate = df.string(from: Date())
            
            //재직 상태는 재직중으로 한다
            param.stateCd = EmpStateType.ING
            
            //DB 처리
            //결과가 성공이면 데이터를 읽어들여 테이블 뷰를 갱신
            if self.empDAO.create(param: param){
                self.empList = self.empDAO.find()
                self.tableView.reloadData()
                
                //내비게이션 타이틀을 갱신
                if let navTitle = self.navigationItem.titleView as? UILabel {
                    navTitle.text = "사원 목록 \n" + "총 \(self.empList.count) 명"
                }
            }
        })
        self.present(alert, animated: false)
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
