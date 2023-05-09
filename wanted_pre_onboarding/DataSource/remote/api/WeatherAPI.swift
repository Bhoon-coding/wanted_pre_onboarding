//
//  WeatherAPI.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2023/05/07.
//

import Foundation

import Alamofire
import RxSwift
import RxCocoa

extension Data.Version {
    struct Weather: APIDefinition {
        var path: String
        
        var headers: HTTPHeaders? = nil
        
        var method: HTTPMethod = .get
        
        init(cityName: String) {
//            self.path = path
            self.path = "/data/2.5/weather?q=\(cityName)&appid=\(Constants.weatherApiKey)&lang=KR"
        }
    }
    
    
}

struct WeatherService {
    func fetchWeathers(cityName: String) -> Observable<WeatherInformation> {
        Data.Version.Weather(cityName: cityName)
            .rx
            .request()
    }
}

extension Reactive where Base == Data.Version.Weather {
    func request() -> Observable<WeatherInformation> {
        NetworkManager.request(path: base.path,
                               method: base.method,
                               header: base.headers)
    }
}
