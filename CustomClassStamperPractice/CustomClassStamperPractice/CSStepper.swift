//
//  CSStepper.swift
//  CustomClassStamperPractice
//
//  Created by 노주영 on 2022/04/12.
//

import UIKit
@IBDesignable                                    //스토리보드에서 미리보기 형식으로 처리
public class CSStepper: UIView {
    
    public var leftButton = UIButton(type: .system)
    public var rightButton = UIButton(type: .system)
    public var centerLabel = UILabel()
    public var stepValue: Int = 1
    
    public var value: Int = 0 {                  //스테퍼의 현재값을 저장할 변수
        didSet{                                  //프로퍼티의 값이 바뀌면 자동으로 호출
            self.centerLabel.text = String(value)
        }
    }
    
    public var leftTitle: String = "↓"{         //좌측 버튼의 타이틀 속성
        didSet{
            self.leftButton.setTitle(leftTitle, for: .normal)
        }
    }
    
    public var rightTitle: String = "↑"{         //우측 버튼의 타이틀 속성
        didSet{
            self.rightButton.setTitle(rightTitle, for: .normal)
        }
    }
    
    public var bgColor: UIColor = UIColor.cyan {         //센터 영역의 색상
        didSet {
            self.centerLabel.backgroundColor = backgroundColor
        }
    }
    
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
    
    // MARK: 스테퍼의 기본 속성 정의
    private func setup(){
        
        let borderWidth: CGFloat = 0.5              //테두리 두께값
        let borderColor = UIColor.blue.cgColor      //테두리 색상값
        //좌측 다운 버튼 속성 설정
        self.leftButton.tag = -1
        self.leftButton.setTitle(self.leftTitle, for: .normal)
        self.leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        self.leftButton.layer.borderWidth = borderWidth
        self.leftButton.layer.borderColor = borderColor
        
        //우측 업 버튼 속성 설정
        self.rightButton.tag = 1
        self.rightButton.setTitle(self.rightTitle, for: .normal)
        self.rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        self.rightButton.layer.borderWidth = borderWidth
        self.rightButton.layer.borderColor = borderColor
        
        //중앙 레이블 속성 설정
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = self.bgColor
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        //영역별 객체를 서브 뷰로 추가
        self.addSubview(self.leftButton)
        self.addSubview(self.rightButton)
        self.addSubview(self.centerLabel)
        
        //버튼의 터치 이벤트와 액션 메소드 연결
        self.leftButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }

    // MARK: 뷰의 크기를 변경할 때 호출하는 메소드
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        //버튼의 너비 = 뷰 높이
        let btnWidth = self.frame.height
        
        //레이블의 너비 = 뷰 전체 크기 - 양쪽 버튼의 너비 합
        let lbWidth = self.frame.width - (btnWidth * 2)
        
        self.leftButton.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.rightButton.frame = CGRect(x: btnWidth + lbWidth, y: 0, width: btnWidth, height: btnWidth)
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lbWidth, height: btnWidth)
    }
    
    // MARK: 액션 메소드
    @objc public func valueChange(_ sender: UIButton){
        //현재의 value 값에 +1 또는 -1한다
        self.value += (sender.tag * self.stepValue)
    }
}
