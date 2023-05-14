//
//  WeatherDetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/13.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    private let weatherInfo: WeatherInformation
    private let weatherDetailView: WeatherDetailView
        
    init(weatherInfo: WeatherInformation) {
        self.weatherInfo = weatherInfo
        self.weatherDetailView = WeatherDetailView(weatherInfo: weatherInfo)
        super.init(nibName: nil, bundle: nil) // 스토리보드를 안썼는데 왜..?
        ///코드로 구현했더라도 UIViewController를 초기화하는 과정에서. nibName, bundle을 사용하지않는다고 명시해야 하기 때문에 nibName, bundle 둘다 nil로 설정해 코드로 구현한 UI를 로드되게 함.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureWeatherDetailViewUI()
        updateWeatherImage()
    }
    
    // MARK: - Methods
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "\(weatherInfo.name)"
    }
    
    private func configureWeatherDetailViewUI() {
        weatherDetailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weatherDetailView)
        
        NSLayoutConstraint.activate([
            weatherDetailView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            weatherDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func updateWeatherImage() {
        guard let iconCode = weatherInfo.weather.first?.icon else { return }
        let iconUrl = "http://openweathermap.org/img/wn/\(iconCode)@2x.png"
        weatherDetailView.weatherIconImageView.load(urlString: iconUrl)
    }
    
    // MARK: - @objc
    
}

// MARK: - Extensions

extension WeatherDetailViewController {
    
}
