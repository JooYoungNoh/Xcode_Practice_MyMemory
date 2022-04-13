//
//  ListTableViewController.swift
//  UserDefaultsPractice
//
//  Created by 노주영 on 2022/04/13.
//

import UIKit

class ListTableViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var married: UISwitch!
    
    @IBAction func changeGender(_ sender: UISegmentedControl){
        let value = sender.selectedSegmentIndex
        
        let plist = UserDefaults.standard       //기본 저장소 객체 가져오기
        plist.set(value, forKey: "gender")      //값을 저장
        plist.synchronize()                     //동기화
    }
    
    @IBAction func changeMarried(_ sender: UISwitch){
        let value = sender.isOn
        
        let plist = UserDefaults.standard       //기본 저장소 객체 가져오기
        plist.set(value, forKey: "married")      //값을 저장
        plist.synchronize()                     //동기화
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let plist = UserDefaults.standard
        
        //저장된 값을 꺼내어 각 컨트롤러 설정
        self.nameLabel.text = plist.string(forKey: "name")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        self.married.isOn = plist.bool(forKey: "married")

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
        
        if indexPath.row == 0 {                     //첫번째 셀이 클릭되었을 때만
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
