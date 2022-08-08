//
//  WeatherViewModel.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/04.
//

import Foundation
import Alamofire

class WeatherViewModel {
    let model = WeatherModel.weatherModel
    static let weatherViewModel = WeatherViewModel()
//    private var parameters: Parameters = [:]
//
    
    var weatherData: WeatherEntity?
    var nowForecastX: Int = 0
    var nowForecastY: Int = 0
}


