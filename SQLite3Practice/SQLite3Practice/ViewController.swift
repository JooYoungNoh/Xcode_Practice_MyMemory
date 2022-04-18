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
      
        let dbPath = self.getDBPath()
        self.dbExecute(dbPath: dbPath)
    }
    
    //DB 관련 작업
    func dbExecute(dbPath: String){
        var db: OpaquePointer? = nil                //SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil              //컴파일된 SQL을 담을 객체
        
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"   //테이블 생성
        
        
        //DB를 연결, 이 과정에서 db객체가 생성
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else {              //데이터베이스가 연결되었다면
            print("Datebase Connect Fail")
            return
        }
        
        defer {                                             //DB 연결을 종료, db 객체가 해제
            print("Close Database Connection")
            sqlite3_close(db)
        }
        //SQL 구문을 전달할 준비, 이 과정에서 컴파일된 SQL 구문 객체가 생성
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else {   //SQL컴파일이 잘 끝났다면
            print("Prepare Statement Fail")
            return
        }
        
        defer{                                      //컴파일된 SQL 구문 객체를 삭제, 이 과정에서 stmt가 해제
            print("Finalize Statement")
            sqlite3_finalize(stmt)
        }
        
        //컴파일된 SQL 구문 객체를 DB에 전달
        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Create Table Success!")
        }
    }
    //DB 경로 찾기 매소드
    func getDBPath() -> String{
        //앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾는다
        let fileMgr = FileManager()                 //파일 매니저 객체를 생성
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!                                      //앱 내의 문서 디렉터리 경로를 찾고 이를 URL객체로 생성
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path                                                        //URL객체에 "db.sqlite"파일 경로를 추가 후 경로 생성
        
        //let dbPath = "/Users/nohjooyoung/db.sqlite"         //파일 생성 되는지 간접적 체험
      
        //dbPath 경로에 파일이 없다면 앱 번들에 만들어 둔 db.sqlite를 가져와 복사
        if fileMgr.fileExists(atPath: dbPath) == false{
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
        }
        return dbPath
    }

}

