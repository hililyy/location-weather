//
//  WeatherVC.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/04.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import CoreLocation

class WeatherVC: UIViewController {
    
    @IBOutlet weak var announcementDay: UILabel!
    @IBOutlet weak var announcementTime: UILabel!
    @IBOutlet weak var forecastX: UILabel!
    @IBOutlet weak var forecastY: UILabel!
    @IBOutlet weak var otherLocationTableView: UITableView!
    let disposeBag = DisposeBag()
    let otherLocationName: [LocationList] = [.incheon, .daejeon, .daegu, .busan, .ulsan]
    private let parameters: Parameters = [
        "serviceKey": "mJz7Lb%2B%2F20Uk8ve5Qx6GMo84GUbN1K%2BqFgbmdO17clsaiJaf3X6d%2FsNBJr5%2Bkvb6V5Wk5M7PqeXwzjMldfipjQ%3D%3D",
        "numOfRows": 10,
        "pageNo": 1,
        "base_date": 20220807,
        "base_time": 0600,
        "nx": 55,
        "ny": 127,
        "dataType": "JSON"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        almotmp().subscribe(
            onNext: { [weak self] response in
                self?.announcementDay.text = response.response.body.items.item[0].baseDate
                self?.announcementTime.text = response.response.body.items.item[0].baseTime
                print("next")
                
            }, onError: { [weak self] error in
                print("error")
            }, onCompleted: {
                print("completed")
            }
        ).disposed(by: disposeBag)
        
        otherLocationTableView.delegate = self
        otherLocationTableView.dataSource = self
    }
    
    func almotmp() -> Observable<WeatherEntity> {
        let urlString = "\(getUrl())"
        return requestJSON(.get, urlString)
                .map { $1 }
                .map { response -> WeatherEntity in
                    let data = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
                    let productListData = try JSONDecoder().decode(WeatherEntity.self, from: data)
                    return productListData.self
                }
    }
}

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherLocationName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = otherLocationTableView.dequeueReusableCell(withIdentifier: "OtherLocationCell", for: indexPath) as! OtherLocationTableViewCell
        switch otherLocationName[indexPath.row] {
            case .incheon:
                cell.locationName.text = "인천"
            case .daejeon:
                cell.locationName.text = "대전"
            case .daegu:
                cell.locationName.text = "대구"
            case .busan:
                cell.locationName.text = "부산"
            case .ulsan:
                cell.locationName.text = "울산"
        }
        return cell
    }
}

