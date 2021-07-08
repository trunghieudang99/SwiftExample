//
//  HomeViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 29/06/2021.
//

import UIKit
import CoreLocation

class HomeViewController: BaseViewController {

    var geocoder = CLGeocoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        let myLocation = CLLocation(latitude:10.7462533, longitude: 106.7271465)


        var myBuddysLocation: CLLocation = CLLocation()

        geocoder.geocodeAddressString("302 Nguyễn Văn Đậu, Phường 11, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam") {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            print("lon \(lon), lat\(lat)")
            myBuddysLocation = CLLocation(latitude: lat ?? 0, longitude: lon ?? 0)
            let distance = myLocation.distance(from: myBuddysLocation) / 1000
            print(String(format: "The distance to my buddy is %.01fkm", distance))
        }
        
    }

}
