//
//  WeatherEntity.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/04.
//

import Foundation

struct WeatherEntity: Codable {
    let numOfRows: Int?
    let pageNo: Int?
    let totalCount: Int?
    let resultCode: Int?
    let resultMsg: String?
    let dataType: String?
    let baseDate: Int?
    let baseTime: Int?
    let nx: Int?
    let ny: Int?
    let category: String?
    let obsrValue: Int?
}
