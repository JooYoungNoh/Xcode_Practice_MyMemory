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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
