//
//  URLSession.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import Foundation

struct URLSessionManager {
    static let shared = URLSessionManager()
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: baseURL + "q=\(cityName)&appid=\(Constants.weatherApiKey)&lang=KR") else {
            return
        }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)
            debugPrint(weatherInformation)
        }.resume()
    }
}
