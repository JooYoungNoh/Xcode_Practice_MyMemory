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
        
        switch type {
        case .rect:
            self.backgroundColor = .black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0     //모서리는 둥글지 않게
            self.setTitleColor(.white, for: .normal)
            self.setTitle("Rect Button", for: .normal)
        case .circle:
            self.backgroundColor = .red
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 50     //모서리는 50만큼 둥글게
            self.setTitle("Circle Button", for: .normal)
        }
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    //생성된 버튼 스타일 변경
    var style: CSButtonType = .rect {
        didSet{
            switch style {
            case .rect:
                self.backgroundColor = .black
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0     //모서리는 둥글지 않게
                self.setTitleColor(.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
            case .circle:
                self.backgroundColor = .red
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 50     //모서리는 50만큼 둥글게
                self.setTitle("Circle Button", for: .normal)
            }
            
        }
    }
    
    //버튼이 클릭된 횟수를 카운트하여 타이틀에 표시해주는 함수
    @objc func counting(_ sender: UIButton){
        sender.tag += 1
        sender.setTitle("\(sender.tag)", for: .normal)
    }
}
