//
//  UserInfoManager.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/14.
//

import UIKit

struct UserInfoKey{
    //저장에 사용할 키
    static let loginId = "LOGINID"
    static let account = "ACCOUNT"
    static let name = "NAME"
    static let profile = "PROFILE"
}

class UserInfoManager{
    //연산 프로퍼티 loginId 정의
    var loginId: Int{
        get{
            return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
        } set(v){
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.loginId)
            ud.synchronize()
        }
    }
    //연산 프로퍼티 account 정의
    var account: String?{
        get{
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        } set(v){
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.account)
            ud.synchronize()
        }
    }
    //연산 프로퍼티 name 정의
    var name: String?{
        get{
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        } set(v){
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    //연산 프로퍼티 profile 정의
    var profile: UIImage?{
        get{
            let ud = UserDefaults.standard
            if let _profile = ud.data(forKey: UserInfoKey.profile){
                return UIImage(data:  _profile)
            } else {
                return UIImage(named: "account")
            }
        } set(v){
            if v != nil {
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.loginId)
            ud.synchronize()
            }
        }
    }
    
    var isLogin: Bool{
        //로그인 아이디가 0이거나 계정이 비어있으면
        if self.loginId == 0 || self.account == nil {
            return false
        } else{
            return true
        }
    }
    
    // MARK: 메소드
    func login(account: String, passwd: String) -> Bool {
        // TODO: 이 부분은 나중에 서버와 연동되는 코드로 대체될 예정
        if account.isEqual("sqlpro@naver.com") && passwd.isEqual("1234"){
            let ud = UserDefaults.standard
            ud.set(100, forKey: UserInfoKey.loginId)
            ud.set(account, forKey: UserInfoKey.account)
            ud.set("재은 씨", forKey: UserInfoKey.name)
            ud.synchronize()
            return true
        } else {
            return false
        }
    }
    
    func logout() -> Bool {
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.loginId)
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.profile)
        ud.synchronize()
        return true
    }
    
}
