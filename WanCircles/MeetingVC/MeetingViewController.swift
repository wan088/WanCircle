//
//  MettingViewController.swift
//  WanCircles
//
//  Created by Yongwan on 06/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//
import Speech
import UIKit
import NMapsMap
class MeetingViewController: UIViewController {
    var marker = NMFMarker()
    @IBAction func comeInBtn(_ sender: Any) {
        let alert = UIAlertController(title: "참석확인", message: "현재 모임에 참석 처리하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "참석", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "작은예술 2회차 모임"
        let mapView = NMFNaverMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        mapView.showLocationButton = true
        view.addSubview(mapView)
        //marker.position = NMGLatLng(lat: , lng: node.coordinate.longitude)
        marker.mapView = mapView.mapView
    
        
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
