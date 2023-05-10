//
//  WeatherViewModel.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2023/05/08.
//

import Foundation

import RxSwift
import RxCocoa

class WeatherViewModel {
    
    let cities = ["gongju",
                  "gwangju",
                  "gumi",
                  "gunsan",
                  "daegu",
                  "daejeon",
                  "mokpo",
                  "busan",
                  "seosan",
                  "seoul",
                  "sokcho",
                  "suwon",
                  "suncheon",
                  "ulsan",
                  "iksan",
                  "jeonju",
                  "jeju",
                  "cheonan",
                  "cheongju",
                  "chuncheon"]
    
    // TODO: [] <#할일#>
    // WeatherViewModel
//    var weatherOfCity = BehaviorSubject<[WeatherInformation]>(value: [])
    var weatherOfCity = BehaviorRelay<[WeatherInformation]>(value: [])
//    var weatherOfCity: [WeatherInformation] = []
    var isLoading = BehaviorSubject<Bool>(value: false)
    let disposeBag = DisposeBag()
    
    
    func getCurrentWeather(cities: [String]) {
        isLoading.onNext(true)
        let observables = cities.map { WeatherService().fetchWeathers(cityName: $0) }
        
        Observable.zip(observables)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] weathers in
                self?.weatherOfCity.accept(weathers)
//                self?.weatherOfCity.onNext(weathers)
                self?.isLoading.onNext(false) /// 질문: 이런상황이면 Subject를 쓰나? 일반 true, false로도 해도 될것같은데
            }
            .disposed(by: disposeBag)

        
        //        cities.forEach {
        //            WeatherService()
        //                .fetchWeathers(cityName: $0)
        //                .observe(on: MainScheduler.instance)
        //                .subscribe { [weak self] weather in
        //                    self?.weatherOfCity.append(weather)
        ////        //                    self?.weatherCollectionView.reloadData()
        ////        //                    self?.removeSpinnerView()
        //                }
        //                .disposed(by: disposeBag)
        //
        //        }
    }
    
    
}

//
//
//let workingQueue = DispatchQueue(label: "workingQueue", attributes: .concurrent)
//let workGroup = DispatchGroup()
//let defaultQueue = DispatchQueue.main
//
//cities.forEach { city in
//    workGroup.enter()
//    NetworkManager.shared.fetchCurrentWeather(cityName: city) { (response) in
//        switch response {
//        case .success(let weatherData):
//            workingQueue.async(group: workGroup) {
//                self.weatherOfCity.append(weatherData)
//                workGroup.leave()
//            }
//        case .failure(let error):
//            print("current weather response failure: \(error.localizedDescription)")
//        }
//    }
//}
//
//workGroup.notify(queue: defaultQueue) {
//    self.weatherCollectionView.reloadData()
//    self.removeSpinnerView()
//}
