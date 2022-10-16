//
//  WeatherViewModel.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/04.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

class WeatherViewModel {
    let model = WeatherModel.weatherModel
    static let weatherViewModel = WeatherViewModel()
    private var parameters: Parameters = [:]
    
    var weatherData: WeatherEntity?
    var nowForecastX: Int = 0
    var nowForecastY: Int = 0
    let otherLocationName: [LocationList] = [.incheon, .daejeon, .daegu, .busan, .ulsan]
    
    
    func settingParameter() {
        parameters = [
            "serviceKey": "mJz7Lb%2B%2F20Uk8ve5Qx6GMo84GUbN1K%2BqFgbmdO17clsaiJaf3X6d%2FsNBJr5%2Bkvb6V5Wk5M7PqeXwzjMldfipjQ%3D%3D",
            "numOfRows": 10,
            "pageNo": 1,
            "base_date": 20220807,
            "base_time": 0600,
            "nx": WeatherViewModel.weatherViewModel.nowForecastX,
            "ny": WeatherViewModel.weatherViewModel.nowForecastY,
            "dataType": "JSON"
        ]
    }
    func apiRequest() -> Observable<WeatherEntity>{
        model.apiRequest()
    }
}


