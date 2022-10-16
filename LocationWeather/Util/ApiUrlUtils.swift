//
//  ApiUrlUtils.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/06.
//

import Foundation

let baseURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=mJz7Lb%2B%2F20Uk8ve5Qx6GMo84GUbN1K%2BqFgbmdO17clsaiJaf3X6d%2FsNBJr5%2Bkvb6V5Wk5M7PqeXwzjMldfipjQ%3D%3D&numOfRows=10&pageNo=1&base_date=20220824&base_time=0600&nx=55&ny=127&dataType=JSON"

func getUrl() -> String {
    return baseURL
}

enum ApiPath: String {
    case short_time_live = "1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
}
