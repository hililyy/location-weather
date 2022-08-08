//
//  OtherLocationVC.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/09.
//

import UIKit
import CoreXLSX

class OtherLocationVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var otherLocationListTableView: UITableView!
    
    var selectedWeatherData:[[String]] = []
    var selectLocation: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        otherLocationListTableView.dataSource = self
        otherLocationListTableView.delegate = self
        detailTitle.text = "\(selectLocation) 지역 날씨 정보"
        loadLocationsFromCSV()
    }
    
    private func parseCSVAt(url:URL) {
           do {
               let data = try Data(contentsOf: url)
               let dataEncoded = String(data: data, encoding: .utf8)
               
               if let dataArr = dataEncoded?.components(separatedBy: "\n")
                .map({$0.components(separatedBy: ",")}) {
                   for item in dataArr {
                       if item[0] != "" {
                           if item[2] == selectLocation {
                               selectedWeatherData.append(item)
                           } else { continue }
                       } else { continue }
                   }
               }
           } catch  {
               print("Error reading CSV file")
           }
       }
    private func loadLocationsFromCSV() {
           let path = Bundle.main.path(forResource: "weather", ofType: "csv")!
           parseCSVAt(url: URL(fileURLWithPath: path))
           otherLocationListTableView.reloadData()
       }
}

extension OtherLocationVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedWeatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = otherLocationListTableView.dequeueReusableCell(withIdentifier: "OtherLocationDetailTableViewCell", for: indexPath) as! OtherLocationDetailTableViewCell
        
        cell.firstTitle.text = selectedWeatherData[indexPath.row][2]
        cell.secondTitle.text = selectedWeatherData[indexPath.row][3]
        cell.thirdTitle.text = selectedWeatherData[indexPath.row][4]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "OtherLocationSelectedVC") as? OtherLocationSelectedVC {
            vc.selectedDetailWeatherData = selectedWeatherData[indexPath.row]
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .popover
            
            self.present(vc, animated: true, completion: nil)
        }
    }
}
