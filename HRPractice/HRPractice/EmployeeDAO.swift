//
//  EmployeeDAO.swift
//  HRPractice
//
//  Created by 노주영 on 2022/04/20.
//

enum EmpStateType: Int {
    case ING = 0, STOP, OUT     // 재직중, 휴직, 퇴사
    
    func desc() -> String{
        switch self {
        case .ING:
            return "재직중"
        case .STOP:
            return "휴직"
        case .OUT:
            return "퇴사"
        }
    }
    
}

struct EmployeeV0{
    
}

class EmployeeDAO {
    
}
