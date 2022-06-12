//
//  URLSession.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import Foundation

struct URLSessionManager {
    static let shared = URLSessionManager()
    let baseURL = "https://api.openweathermap.org/"
    
    func fetchCurrentWeather(cityName: String, completion: @escaping (Result<Any, Error>) -> ()) {
        guard let url = URL(string: baseURL + "data/2.5/weather?q=\(cityName)&appid=\(Constants.weatherApiKey)&lang=KR") else {
            return
        }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            
            guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)
             else { return }
            completion(.success(weatherInformation))
        }.resume()
        
    }
}
