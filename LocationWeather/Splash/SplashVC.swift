//
//  SplashVC.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/08.
//

import UIKit
import Lottie
import CoreLocation

class SplashVC: UIViewController {

    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var goodView: UIView!
    var locationManager: CLLocationManager!
    let model = WeatherViewModel.weatherViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherLottieInit()
        goodLottieInit()

    }
    
    @IBAction func start(_ sender: Any) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func weatherLottieInit() {
        let animationView = AnimationView(name: "weather")
        self.view.addSubview(animationView)
        
        animationView.frame = self.weatherView.bounds
        animationView.center = self.weatherView.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.7
        animationView.play()
        animationView.loopMode = .loop
    }
    
    func goodLottieInit() {
        let animationView = AnimationView(name: "good")
        self.view.addSubview(animationView)
        
        animationView.frame = self.goodView.bounds
        animationView.center = self.goodView.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.7
        animationView.play()
        animationView.loopMode = .loop
    }
}
extension SplashVC: CLLocationManagerDelegate {
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()

    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           switch status {
           case .authorizedAlways, .authorizedWhenInUse:
               print("GPS 권한 설정됨")
               showMainViewController()
               self.locationManager.startUpdatingLocation() // 중요!
           case .restricted, .notDetermined:
               print("GPS 권한 설정되지 않음")
               getLocationUsagePermission()
           case .denied:
               print("GPS 권한 요청 거부됨")
               getLocationUsagePermission()
           default:
               print("GPS: Default")
           }
       }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            // the most recent location update is at the end of the array.
            let location: CLLocation = locations[locations.count - 1]
            let longtitude: CLLocationDegrees = location.coordinate.longitude
            let latitude:CLLocationDegrees = location.coordinate.latitude
        
        model.nowForecastX = Int(longtitude)
        model.nowForecastY = Int(latitude)
        
    }
    
    func showMainViewController() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "WeatherVC") as! WeatherVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

}
