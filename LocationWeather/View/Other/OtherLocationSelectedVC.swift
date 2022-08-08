//
//  OtherLocationSelectedVC.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/09.
//

import UIKit

class OtherLocationSelectedVC: UIViewController {
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var nx: UILabel!
    @IBOutlet weak var ny: UILabel!
    @IBOutlet weak var nxHour: UILabel!
    @IBOutlet weak var nxMinute: UILabel!
    @IBOutlet weak var nxSecond: UILabel!
    @IBOutlet weak var nyHour: UILabel!
    @IBOutlet weak var nyMinute: UILabel!
    @IBOutlet weak var nySecond: UILabel!
    @IBOutlet weak var nxMileSecond: UILabel!
    @IBOutlet weak var nyMileSecond: UILabel!
    @IBOutlet weak var locationUpdate: UILabel!
    
    let model = WeatherViewModel.weatherViewModel
    var selectedDetailWeatherData: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTitle.text = "\(selectedDetailWeatherData[2]) \(selectedDetailWeatherData[3]) \(selectedDetailWeatherData[4]) 날씨 정보"
        self.nx.text = selectedDetailWeatherData[5]
        self.ny.text = selectedDetailWeatherData[6]
        self.nxHour.text = selectedDetailWeatherData[7]
        self.nxMinute.text = selectedDetailWeatherData[8]
        self.nxSecond.text = selectedDetailWeatherData[9]
        self.nyHour.text = selectedDetailWeatherData[10]
        self.nyMinute.text = selectedDetailWeatherData[11]
        self.nySecond.text = selectedDetailWeatherData[12]
        self.nxMileSecond.text = selectedDetailWeatherData[13]
        self.nyMileSecond.text = selectedDetailWeatherData[14]
        self.locationUpdate.text = selectedDetailWeatherData[15]
    }
}
