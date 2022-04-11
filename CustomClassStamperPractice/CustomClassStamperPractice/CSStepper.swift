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
        
        let borderWidth: CGFloat = 0.5              //테두리 두께값
        let borderColor = UIColor.blue.cgColor      //테두리 색상값
        //좌측 다운 버튼 속성 설정
        self.leftButton.tag = -1
        self.leftButton.setTitle("↓", for: .normal)
        self.leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        self.leftButton.layer.borderWidth = borderWidth
        self.leftButton.layer.borderColor = borderColor
        
        //우측 업 버튼 속성 설정
        self.rightButton.tag = 1
        self.rightButton.setTitle("↑", for: .normal)
        self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        self.rightButton.layer.borderWidth = borderWidth
        self.rightButton.layer.borderColor = borderColor
        
        //중앙 레이블 속성 설정
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = .cyan
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        //영역별 객체를 서브 뷰로 추가
        self.addSubview(self.leftButton)
        self.addSubview(self.rightButton)
        self.addSubview(self.centerLabel)
    }

}
