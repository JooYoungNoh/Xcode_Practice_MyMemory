//
//  MemoListViewController.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/06.
//

import UIKit

class MemoListViewController: UIViewController, UITableViewDataSource {
    //앱 델리게이트 객체의 참조 정보를 읽어온다
    let appDelgate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: 테이블 구성 메소드들
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다
        let row = self.appDelgate.memolist[indexPath.row]
        
        //이미지 속성이 비어 있을 경우 "MemoCell" 아니면 "ImageMemoCell"
        let Identifier = row.image == nil ? "memoCell" : "imageMemoCell"
        
        //재사용 큐로부터 프로토타입 셀의 인스턴스를 전달 받는다
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier) as! MemoCell
        
        //memoCell의 내용을 구성
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        //Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포맷에 맞게 변경한다
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        //cell 객체를 리턴
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appDelgate.memolist.count
    }
    
    func tableview(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }

}

