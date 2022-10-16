//
//  WeatherRepository.swift
//  LocationWeather
//
//  Created by 강조은 on 2022/08/06.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

let disposeBag = DisposeBag()

class WeatherRepository {
    let urlString = "\(getUrl())"
    
    func apiRequest() -> Observable<WeatherEntity> {
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
