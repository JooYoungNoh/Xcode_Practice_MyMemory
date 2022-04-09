//
//  MapKitViewController.swift
//  CustomAlertPractice
//
//  Created by 노주영 on 2022/04/10.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //뷰 컨트롤러에 맵킷 뷰를 추가
        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapkitView
        self.preferredContentSize.height = 200         //맵킷 뷰의 높이 설정
        
        //위치 정보를 설정 (위도,경도)
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        
        //지도에서 보여줄 넓이(축척), 숫자가 작을수록 좁은 범위를 확대시켜서 보여준다
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        //지도 영역을 정의
        let region = MKCoordinateRegion(center: pos, span: span)
        
        //지도 뷰에 표시
        mapkitView.region = region
        mapkitView.regionThatFits(region)
        
        //위치를 핀으로 표시
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
