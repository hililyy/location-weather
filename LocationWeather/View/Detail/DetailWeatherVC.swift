//
//  DetailWeatherVC.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/09.
//

import UIKit

class DetailWeatherVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var baseData: UILabel!
    @IBOutlet weak var baseTime: UILabel!
    @IBOutlet weak var nx: UILabel!
    @IBOutlet weak var ny: UILabel!
    @IBOutlet weak var detailTableView: UITableView!
    
    let model = WeatherViewModel.weatherViewModel
    let response = WeatherViewModel.weatherViewModel.weatherData?.response.body.items.item
    override func viewDidLoad() {
        super.viewDidLoad()
        baseData.text = response?[0].baseDate
        baseTime.text = response?[0].baseTime
        nx.text = String(response?[0].nx ?? 0)
        ny.text = String(response?[0].ny ?? 0)
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
}

extension DetailWeatherVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.weatherData?.response.body.items.item.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailWeatherTableViewCell
        
        let obsr = response?[indexPath.row].obsrValue ?? "정보없음"
        switch response?[indexPath.row].category {
            case "POP":
                cell.category.text = "강수확률"
            cell.dataInfo.text = "\(obsr)%"
            case "PTY":
                cell.category.text = "강수형태"
                cell.dataInfo.text = obsr
            case "PCP":
                cell.category.text = "1시간 강수량"
                cell.dataInfo.text = "\(obsr)범주 (1mm)"
            case "REH":
                cell.category.text = "습도"
                cell.dataInfo.text = "\(obsr)%"
            case "SNO":
                cell.category.text = "1시간 신적설"
                cell.dataInfo.text = "\(obsr)범주 (1cm)"
            case "SKY":
                cell.category.text = "하늘상태"
                cell.dataInfo.text = obsr
            case "TMP":
                cell.category.text = "1시간 기온"
                cell.dataInfo.text = "\(obsr)°C"
            case "TMN":
                cell.category.text = "일 최저기온"
                cell.dataInfo.text = "\(obsr)°C"
            case "TMX":
                cell.category.text = "일 최고기온"
                cell.dataInfo.text = "\(obsr)°C"
            case "UUU":
                cell.category.text = "풍속(동서성분)"
                cell.dataInfo.text = "\(obsr)m/s"
            case "VVV":
                cell.category.text = "풍속(남북성분)"
                cell.dataInfo.text = "\(obsr)m/s"
            case "WAV":
                cell.category.text = "파고"
                cell.dataInfo.text = "\(obsr)M"
            case "VEC":
                cell.category.text = "풍향"
                cell.dataInfo.text = "\(obsr)deg"
            case "WSD":
                cell.category.text = "풍속"
                cell.dataInfo.text = "\(obsr)m/s"
            case "T1H":
                cell.category.text = "기온"
                cell.dataInfo.text = "\(obsr)°C"
            case "RN1":
                cell.category.text = "1시간 강수량"
                cell.dataInfo.text = "\(obsr)범주 (1mm)"
            case "LGT":
                cell.category.text = "낙뢰"
                cell.dataInfo.text = obsr

            default: break
        }
        return cell
        
    }
}
