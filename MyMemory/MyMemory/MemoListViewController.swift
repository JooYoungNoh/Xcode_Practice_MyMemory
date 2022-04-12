//
//  MemoListViewController.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/06.
//

import UIKit

class MemoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //memolist 배열에서 선택된 행에 맞는 데이터를 꺼낸다
        let row = self.appDelgate.memolist[indexPath.row]
        
        //메모읽기 화면의 인스턴스를 생성
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoReadViewController") as? MemoReadViewController else { return }
        
        //값을 전달한 다음, 다음화면으로 이동한다
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //SWRevealViewController 라이브러리의 revealViewController 객체를 읽어온다
        if let revealVC = self.revealViewController(){
            //바 버튼 아이템 객체를 정의한다
            let btn = UIBarButtonItem()
            btn.image = UIImage(named: "sidemenu")
            btn.target = revealVC                //버튼 클릭 시 호출할 메소드가 정의된 객체
            btn.action = #selector(revealVC.revealToggle(_:))
            
            //정의된 바 버튼을 내비게이션 바의 왼쪽 아이템으로 등록
            self.navigationItem.leftBarButtonItem = btn
            
            //제스처 객체를 뷰에 추가
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }

    // MARK: ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }

}

