//
//  ViewController.swift
//  SQLite3Practice
//
//  Created by 노주영 on 2022/04/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var db: OpaquePointer? = nil                //SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil              //컴파일된 SQL을 담을 객체
        
        //앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾는다
        let fileMgr = FileManager()                 //파일 매니저 객체를 생성
        let docPathURL = fileMgr.urls(for: .desktopDirectory, in: .userDomainMask).first!                                      //앱 내의 문서 디렉터리 경로를 찾고 이를 URL객체로 생성
        let dbPath = docPathURL.appendingPathComponent("db.sqlite")?.path                                                       //URL객체에 "db.sqlite"파일 경로를 추가 후 경로 생성
        
    }


}

