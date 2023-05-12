//
//  URLSession.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import Foundation

import Alamofire
import RxSwift

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
    ) -> Observable<R> {
        
        Observable<R>.create { observer in
            // TODO: [] path 작업중
            guard let url = URL(string: host + path) else {
                observer.onError(NetworkError.invalidURL)
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
//                        print("Error: \(afError)")
//                        print("responseBody: \(responseBodyString)")
                        observer.onError(afError)
//                        observer(.failure(afError))
                        return
                        
                    case let .success(response):
//                        print("Response")
//                        print("responseBody: \(responseBodyString)")
                        observer.onNext(response)
//                        observer(.success(response))
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
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
