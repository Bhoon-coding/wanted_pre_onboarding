//
//  WeatherViewModel.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2023/05/08.
//

import Foundation

import RxCocoa
import RxSwift

final class WeatherViewModel {
    // MARK: - Properties
    
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
    
    var weatherOfCity = BehaviorRelay<[WeatherInformation]>(value: [])
    var isLoading = BehaviorSubject<Bool>(value: false)
    let disposeBag = DisposeBag()
    
    // MARK: - Methods
    
    func getCurrentWeather(cities: [String]) {
        isLoading.onNext(true)
        let observables = cities.map { WeatherService().fetchWeathers(cityName: $0) }
        
        Observable.zip(observables)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] weathers in
                self?.weatherOfCity.accept(weathers)
                self?.isLoading.onNext(false) /// 질문: 이런상황이면 Subject를 쓰나? 일반 true, false로도 해도 될것같은데
            }
            .disposed(by: disposeBag)
    }
    
}
