//
//  ListTableViewController.swift
//  UserDefaultsPractice
//
//  Created by 노주영 on 2022/04/13.
//

import UIKit

class ListTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var married: UISwitch!
    @IBOutlet weak var account: UITextField!
    
    //피커 뷰에 사용될 이메일 배열
    var accountList: [String] = []
    
    
    // MARK: 아웃렛 액션
    @IBAction func changeGender(_ sender: UISegmentedControl){
        let value = sender.selectedSegmentIndex
        
        //성별 저장 로직 시작
         let customPlist = "\(self.account.text!).plist"
         
         let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
         let path = paths[0] as NSString
         let plist = path.strings(byAppendingPaths: [customPlist])[0]
         let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
         
         data.setValue(value, forKey: "gender")
         data.write(toFile: plist, atomically: true)
         
    }
    
    @IBAction func changeMarried(_ sender: UISwitch){
        let value = sender.isOn
        
        //결혼 여뷰 저장 로직 시작
         let customPlist = "\(self.account.text!).plist"
         
         let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
         let path = paths[0] as NSString
         let plist = path.strings(byAppendingPaths: [customPlist])[0]
         let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
         
         data.setValue(value, forKey: "married")
         data.write(toFile: plist, atomically: true)
         
    }
    
   /* @IBAction func edit(_ sender: UITapGestureRecognizer){
        //입력이 가능한 알림창을 띄워 이름을 수정할 수 있도록 한다
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        
        //입력필드 추가
        alert.addTextField(){
            $0.text = self.nameLabel.text      //name 레이블의 텍스트를 입력폼의 기본값으로 넣어준다
        }
        
        //버튼 및 액션 추가
        alert.addAction(UIAlertAction(title: "OK", style: .default){ (_) in
          //사용자가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장
            let value = alert.textFields?[0].text
            
            let plist = UserDefaults.standard
            plist.set(value, forKey: "name")
            plist.synchronize()
            
            //수정된 값을 이름 레이블에도 적용
            self.nameLabel.text = value
        })
        
        //알림창을 띄운다
        self.present(alert, animated: false, completion: nil)
    }*/
    
    // MARK: ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        let plist = UserDefaults.standard
        let picker = UIPickerView()
        
        //저장된 값을 꺼내어 각 컨트롤러 설정
        self.nameLabel.text = plist.string(forKey: "name")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        self.married.isOn = plist.bool(forKey: "married")
        
        //피커 뷰의 델리게이트 객체 지정
        picker.delegate = self
        //account 텍스트 필드 입력 방식을 가상 키보드 대신 피커 뷰로 설정
        self.account.inputView = picker

        //툴 바 객체 정의
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        toolBar.barTintColor = .lightGray
        
        //액세서리 뷰 영역에 툴 바를 표시
        self.account.inputAccessoryView = toolBar
        
        //툴바에 들어갈 닫기 버튼
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone(_:))
        
        //가변 폭 버튼 정의
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //신규 계정 등록 버튼
        let newEmail = UIBarButtonItem()
        newEmail.title = "New"
        newEmail.target = self
        newEmail.action = #selector(newAccount(_:))
        
        //버튼을 툴 바에 추가
        toolBar.setItems([newEmail, flexSpace, done], animated: true)
        
        //저장된 계정 선택 정보 읽어오기
        let accountList = plist.array(forKey: "accountList") as? [String] ?? [String]()
        
        if let account3 = plist.string(forKey: "selectedAccount"){
            self.account.text = account3
        }
    }
    
    // MARK: 액션 메소드
    @objc func pickerDone(_ sender: Any){
        self.view.endEditing(true)          //입력 뷰를 닫음
    }

    @objc func newAccount(_ sender: Any){
        self.view.endEditing(true)                      //입력창 닫기
        
        //알림창 객체 생성
        let alert = UIAlertController(title: "새 계정을 입력하세여", message: nil, preferredStyle: .alert)
        
        //입력폼 추가
        alert.addTextField(){
            $0.placeholder = "ex) abc@gmail.com"
        }
        
        //버튼 및 액션 정의
        alert.addAction(UIAlertAction(title: "OK", style: .default){ (_) in
            if let account2 = alert.textFields?[0].text{
                //계정 목록 배열에 추가
                self.accountList.append(account2)
                //계정 텍스트 필드에 표시
                self.account.text = account2
                
                //컨트롤 값을 모두 초기화한다
                self.nameLabel.text = ""
                self.gender.selectedSegmentIndex = 0
                self.married.isOn = false
                
                //계정 목록을 통째로 저장
                let plist = UserDefaults.standard
                plist.set(self.accountList, forKey: "accountList")
                plist.set(account2, forKey: "selectedAccount")
                plist.synchronize()
            }
            })
        //알림창 오픈
        self.present(alert, animated: false)
        
    }
    // MARK: - Picker view 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //선택한 계정값을 텍스트 필드에 입력
        let account1 = self.accountList[row]
        self.account.text = account1
        
        //사용자가 계정을 입력하면 이 계정을 선택한 것으로 간주하고 저장
        let plist = UserDefaults.standard
        plist.set(account1, forKey: "selectedAccount")
        plist.synchronize()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return super.numberOfSections(in: tableView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {                     //두번째 셀이 클릭되었을 때만
            //입력이 가능한 알림창을 띄워 이름을 수정할 수 있도록 한다
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
            
            //입력필드 추가
            alert.addTextField(){
                $0.text = self.nameLabel.text      //name 레이블의 텍스트를 입력폼의 기본값으로 넣어준다
            }
            
            //버튼 및 액션 추가
            alert.addAction(UIAlertAction(title: "OK", style: .default){ (_) in
              //사용자가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장
                let value = alert.textFields?[0].text
                
               //이름 저장 로직 시작
                let customPlist = "\(self.account.text!).plist"
                
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let path = paths[0] as NSString
                let plist = path.strings(byAppendingPaths: [customPlist])[0]
                let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
                
                data.setValue(value, forKey: "name")
                data.write(toFile: plist, atomically: true)
                
                //수정된 값을 이름 레이블에도 적용
                self.nameLabel.text = value
            })
            
            //알림창을 띄운다
            self.present(alert, animated: false, completion: nil)
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
