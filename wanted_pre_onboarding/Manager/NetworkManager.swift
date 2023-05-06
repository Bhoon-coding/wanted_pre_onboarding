//
//  URLSession.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import Foundation

private enum WeatherAPI {
    
    static let baseURL = "https://api.openweathermap.org/"
}

struct NetworkManager {
    static let shared = NetworkManager()
    
//    static func request<R: Codable>(host: String = )
    
    func fetchCurrentWeather(cityName: String,
                             completion: @escaping (Result<WeatherInformation, Error>) -> ()
    ) {
        guard let url = URL(string: WeatherAPI.baseURL + "data/2.5/weather?q=\(cityName)&appid=\(Constants.weatherApiKey)&lang=KR") else { return }
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
