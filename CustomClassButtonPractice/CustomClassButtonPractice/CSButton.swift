//
//  CSButton.swift
//  CustomClassButtonPractice
//
//  Created by 노주영 on 2022/04/11.
//

import UIKit

//버튼 타입을 결정하는 열거형
public enum CSButtonType{
    case rect
    case circle
}

class CSButton: UIButton {
    //스토리보드를 이용할 때 초기화 메소드
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //스토리보드 방식으로 버튼을 정의했을 때 적용
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
    }
    //인자값이 있는 메소드
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("코드로 생성된 버튼", for: .normal)
        
    }
    //인자값이 없는 메소드
    init(){
        super.init(frame: CGRect.zero)
    }
    //열거형에 사용할 초기화 메소드
    convenience init(type: CSButtonType){
        self.init()
    }
}
