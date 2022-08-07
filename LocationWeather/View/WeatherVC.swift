//
//  WeatherVC.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/04.
//

import UIKit

class WeatherVC: UIViewController {
    
    @IBOutlet weak var announcementDay: UILabel!
    @IBOutlet weak var announcementTime: UILabel!
    @IBOutlet weak var forecastX: UILabel!
    @IBOutlet weak var forecastY: UILabel!
    @IBOutlet weak var otherLocationTableView: UITableView!
    
    let otherLocationName: [LocationList] = [.incheon, .daejeon, .daegu, .busan, .ulsan]
    override func viewDidLoad() {
        super.viewDidLoad()
        otherLocationTableView.delegate = self
        otherLocationTableView.dataSource = self
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

