//
//  URLSession.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import Foundation

import Alamofire
import RxSwift

private enum WeatherAPI {
    
//    static let baseURL = "https://api.openweathermap.org/"
}

struct NetworkManager {
    static let shared = NetworkManager()
    
    let session: Session
    
    private init() {
        let configuration = URLSessionConfiguration.default
        /// 4초 이내로 response가 없을시 에러 처리
        configuration.timeoutIntervalForRequest = 4
        
        session = Session(configuration: configuration)
        
    }
    
    static func request<R: Codable>(host: String = APICommon.host,
                                    path: String,
                                    method: HTTPMethod = .get,
                                    header: HTTPHeaders? = nil
    ) -> Single<R> {
        
        Single<R>.create { observer in
            // TODO: [] path 작업중
            guard let url = URL(string: host + path) else {
                observer(.failure(NetworkError.invalidURL))
                return Disposables.create()
            }
            
            let request = NetworkManager.shared.session
                .request(url,
                         method: .get)
                .responseDecodable(of: R.self) { response in
                    var responseBodyString = ""
                    
                    if let responseBody = response.data,
                       let stringData = String(data: responseBody, encoding: .utf8) {
                        responseBodyString = stringData
                    }
                    
                    switch response.result {
                    case let .failure(afError):
                        print("Error: \(afError)")
                        print("responseBody: \(responseBodyString)")
                        observer(.failure(afError))
                        return
                        
                    case let .success(response):
                        print("Response")
                        print("responseBody: \(responseBodyString)")
                        observer(.success(response))
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
//    func fetchCurrentWeather(cityName: String,
//                             completion: @escaping (Result<WeatherInformation, Error>) -> ()
//    ) {
//        guard let url = URL(string: APICommon.host + "/data/2.5/weather?q=\(cityName)&appid=\(Constants.weatherApiKey)&lang=KR") else { return }
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            let decoder = JSONDecoder()
//
//            guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)
//             else { return }
//            completion(.success(weatherInformation))
//        }.resume()
//
//    }
}


enum NetworkError: Error {
    case invalidURL
    
    var messageDescription: String {
        switch self {
        case .invalidURL:
            return "유효하지 않은 URL 입니다."
        }
    }
}
