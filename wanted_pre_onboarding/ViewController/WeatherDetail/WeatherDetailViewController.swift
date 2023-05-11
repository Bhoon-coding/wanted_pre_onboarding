//
//  WeatherDetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/13.
//

import UIKit

final class WeatherDetailViewController: UIViewController {
    
    // MARK: - Properties
    
//    let weatherInformation: WeatherInformation
//
//    init(weatherInformation: WeatherInformation) {
//        self.weatherInformation = weatherInformation
//
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    // MARK: - UIProperties
//
//    private lazy var wholeWrapper: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var weatherIconImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private lazy var descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        label.textColor = .white
//        label.text = weatherInformation.weather.first?.description
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let tempWrapper: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var currentTempLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 60)
//        label.textColor = .white
//        label.text = "\(Int(weatherInformation.temp.temp - 273.15))°"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var maxTempLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "\(WeatherString.highestTemp)  \(Int(weatherInformation.temp.tempMax - 273.15))°"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var minTempLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "\(WeatherString.lowestTemp)  \(Int(weatherInformation.temp.tempMin - 273.15))°"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var feelTempLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "\(WeatherString.feelTemp)  \(Int(weatherInformation.temp.feelsLike - 273.15))°"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var etcHorizontalWrapper: UIStackView = {
//        let stackView = UIStackView()
//        stackView.spacing = 8
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var pressureStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.spacing = 8
//        stackView.distribution = .fillEqually
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var pressureTitleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = .white
//        label.text = "\(WeatherString.pressure)"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var pressureImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.tintColor = .white
//        imageView.image = UIImage(systemName: "\(WeatherString.Images.pressure)")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private lazy var pressureDetailLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "\(weatherInformation.temp.pressure) \(WeatherString.Units.pressure)"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var windStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.spacing = 8
//        stackView.distribution = .fillEqually
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var windTitleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = .white
//        label.text = "\(WeatherString.wind)"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var windImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.tintColor = .white
//        imageView.image = UIImage(systemName: "\(WeatherString.Images.wind)")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private lazy var windDetailLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "\(Int(weatherInformation.wind.speed)) \(WeatherString.Units.wind)"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var humidityStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.spacing = 8
//        stackView.distribution = .fillEqually
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var humidityTitleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = .white
//        label.text = "\(WeatherString.humidity)"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var humidityImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.tintColor = .white
//        imageView.image = UIImage(systemName: "\(WeatherString.Images.humidity)")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private lazy var humidityDetailLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.text = "\(weatherInformation.temp.humidity)\(WeatherString.Units.humidity)"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private let weatherInfo: WeatherInformation
    private let weatherDetailView: WeatherDetailView
        
    init(weatherInfo: WeatherInformation, weatherDetailView: WeatherDetailView) {
        self.weatherInfo = weatherInfo
        self.weatherDetailView = weatherDetailView
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(weatherDetailView)
//        configureUI()
        configureNavigationBar()
        updateWeatherImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tempWrapper.layer.addBorder([.top], color: .white, width: 1.0)
//        etcHorizontalWrapper.layer.addBorder([.top], color: .white, width: 1.0)
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


//// MARK: - NameSpaces
//
//private enum WeatherString {
//    static let highestTemp = "최고"
//    static let lowestTemp = "최저"
//    static let feelTemp = "체감"
//    static let pressure = "기압"
//    static let wind = "풍속"
//    static let humidity = "습도"
//    
//    enum Images {
//        static let pressure = "dial.max"
//        static let wind = "wind"
//        static let humidity = "humidity.fill"
//    }
//    
//    enum Units {
//        static let pressure = "hpa"
//        static let wind = "m/s"
//        static let humidity = "%"
//    }
//}
