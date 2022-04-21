//
//  ListVC.swift
//  CoreDataPractice
//
//  Created by 노주영 on 2022/04/22.
//

import UIKit
import CoreData

class ListVC: UITableViewController {
    //데이터 소스 역할을 할 배열 변수
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //해당하는 데이터 가져오기
        let record = self.list[indexPath.row]
        let title = record.value(forKey: "title") as? String
        let contents = record.value(forKey: "contents") as? String
        
        //셀을 생성하고, 값을 대입
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = contents

        return cell
    }
    
    //MARK: 액션 메소드
    //데이터 저장 버튼에 대한 액션 메소드
    func add(_ sender: Any){
        
    }
    
    //MARK: 메소드들
    //데이터를 읽어올 메소드
    func fetch() -> [NSManagedObject]{
        //앱 델리게이트 객체 참조
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        //요청 객체 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Board")
        //데이터 가져오기
        let result = try! context.fetch(fetchRequest)
        return result
    }
    
    //데이터를 저장할 메소드
    func save(title: String, contents: String) -> Bool {
        
    }
    
}
