//
//  WeatherDetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/13.
//

import UIKit

final class WeatherDetailViewController: UIViewController {
    
    private let weatherInfo: WeatherInformation
    private let weatherDetailView: WeatherDetailView
        
    init(weatherInfo: WeatherInformation) {
        self.weatherInfo = weatherInfo
        self.weatherDetailView = WeatherDetailView(weatherInfo: weatherInfo)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(weatherDetailView)
        configureNavigationBar()
        updateWeatherImage()
    }
    
    // MARK: - Methods
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "\(weatherInfo.name)"
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
