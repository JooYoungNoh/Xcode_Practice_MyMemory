//
//  CSStepper.swift
//  CustomClassStamperPractice
//
//  Created by 노주영 on 2022/04/12.
//

import UIKit

public class CSStepper: UIView {
    
    public var leftButton = UIButton(type: .system)
    public var rightButton = UIButton(type: .system)
    public var centerLabel = UILabel()
    public var value: Int = 0               //스테퍼의 현재값을 저장할 변수
    
    //스토리보드에서 호출할 초기화 메소드
    public required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.setup()
    }
    
    //코드로 호출할 초기화 메소드
    public override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }
    
    //스테퍼의 기본 속성 정의
    private func setup(){
        
    }

}
