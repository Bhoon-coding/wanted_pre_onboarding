//
//  Weather.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

/*
 TODO: [] 첫번째 페이지 데이터
 도시이름: name
 날씨 아이콘: weather.icon
 현재기온: main.temp
 현재습도: main.humidity
 */

/*
 TODO: [] 두번째 페이지 데이터
 도시이름: name
 날씨아이콘: weather.icon
 날씨설명: weather.description
 현재기온: main.temp
 체감기온: main.feels_like
 현재습도: main.humidity
 최저기온: main.temp_min
 최고기온: main.temp_max
 기압: main.pressure
 풍속: wind.speed (단위: m/s)
 */

import Foundation

struct WeatherInformation: Codable {
    let weather: [Weather]
    let temp: Temp
    let wind: Wind
    let name: String
    
}

struct Weather: Codable {
    let icon: String
    let description: String
}

struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

struct Wind: Codable {
    let speed: Double
}


