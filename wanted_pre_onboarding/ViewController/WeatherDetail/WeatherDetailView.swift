//
//  WeatherDetailView.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2023/05/11.
//

import UIKit

final class WeatherDetailView: UIView {
    
    let weatherInfo: WeatherInformation
    
    // MARK: - UIProperties
    
    private lazy var wholeWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // TODO: 질문 = 상속받는 class에서 이걸쓸땐 private을 해제해야하나?
    lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = weatherInfo.weather.first?.description
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tempWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.text = "\(Int(weatherInfo.temp.temp - 273.15))°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(WeatherString.highestTemp)  \(Int(weatherInfo.temp.tempMax - 273.15))°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(WeatherString.lowestTemp)  \(Int(weatherInfo.temp.tempMin - 273.15))°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var feelTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(WeatherString.feelTemp)  \(Int(weatherInfo.temp.feelsLike - 273.15))°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var etcHorizontalWrapper: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var pressureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var pressureTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.text = "\(WeatherString.pressure)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pressureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "\(WeatherString.Images.pressure)")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var pressureDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(weatherInfo.temp.pressure) \(WeatherString.Units.pressure)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var windTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.text = "\(WeatherString.wind)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "\(WeatherString.Images.wind)")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var windDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(Int(weatherInfo.wind.speed)) \(WeatherString.Units.wind)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var humidityTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.text = "\(WeatherString.humidity)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "\(WeatherString.Images.humidity)")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidityDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(weatherInfo.temp.humidity)\(WeatherString.Units.humidity)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - LifeCycle
    
    init(weatherInfo: WeatherInformation) {
        self.weatherInfo = weatherInfo
        super.init()
        tempWrapper.layer.addBorder([.top], color: .white, width: 1.0)
        etcHorizontalWrapper.layer.addBorder([.top], color: .white, width: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureUI() {
        self.backgroundColor = .systemTeal
    
        [wholeWrapper,
         weatherIconImageView,
         tempWrapper,
         descriptionLabel,
         currentTempLabel,
         maxTempLabel,
         minTempLabel,
         feelTempLabel,
         etcHorizontalWrapper,
         pressureStackView,
         windStackView,
         humidityStackView
        ].forEach { self.addSubview($0) }
        
        [pressureTitleLabel,
         pressureImageView,
         pressureDetailLabel].forEach {
            pressureStackView.addArrangedSubview($0)
        }
        
        [windTitleLabel,
         windImageView,
         windDetailLabel].forEach {
            windStackView.addArrangedSubview($0)
        }
        
        [humidityTitleLabel,
         humidityImageView,
         humidityDetailLabel].forEach {
            humidityStackView.addArrangedSubview($0)
        }
        
        [pressureStackView,
         windStackView,
         humidityStackView].forEach {
            etcHorizontalWrapper.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            wholeWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wholeWrapper.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            wholeWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            wholeWrapper.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            weatherIconImageView.topAnchor.constraint(equalTo: wholeWrapper.safeAreaLayoutGuide.topAnchor, constant: 24),
            weatherIconImageView.centerXAnchor.constraint(equalTo: wholeWrapper.centerXAnchor),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 160),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 8),
            descriptionLabel.centerXAnchor.constraint(equalTo: weatherIconImageView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tempWrapper.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            tempWrapper.centerXAnchor.constraint(equalTo: wholeWrapper.centerXAnchor),
            tempWrapper.leadingAnchor.constraint(equalTo: wholeWrapper.leadingAnchor),
            tempWrapper.trailingAnchor.constraint(equalTo: wholeWrapper.trailingAnchor),
            tempWrapper.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            currentTempLabel.leadingAnchor.constraint(equalTo: tempWrapper.leadingAnchor, constant: 56),
            currentTempLabel.centerYAnchor.constraint(equalTo: tempWrapper.centerYAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            maxTempLabel.topAnchor.constraint(equalTo: tempWrapper.topAnchor, constant: 24),
            maxTempLabel.trailingAnchor.constraint(equalTo: tempWrapper.trailingAnchor, constant: -56)
        ])
        
        NSLayoutConstraint.activate([
            minTempLabel.bottomAnchor.constraint(equalTo: tempWrapper.bottomAnchor, constant: -24),
            minTempLabel.trailingAnchor.constraint(equalTo: tempWrapper.trailingAnchor, constant: -56)
        ])
        
        NSLayoutConstraint.activate([
            feelTempLabel.topAnchor.constraint(equalTo: tempWrapper.bottomAnchor),
            feelTempLabel.centerXAnchor.constraint(equalTo: tempWrapper.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            etcHorizontalWrapper.leadingAnchor.constraint(equalTo: wholeWrapper.leadingAnchor),
            etcHorizontalWrapper.trailingAnchor.constraint(equalTo: wholeWrapper.trailingAnchor),
            etcHorizontalWrapper.topAnchor.constraint(equalTo: feelTempLabel.bottomAnchor, constant: 24),
            etcHorizontalWrapper.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            pressureStackView.leadingAnchor.constraint(equalTo: wholeWrapper.leadingAnchor),
            pressureStackView.topAnchor.constraint(equalTo: feelTempLabel.bottomAnchor, constant: 40),
            pressureStackView.widthAnchor.constraint(equalToConstant: 80),
            pressureStackView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            pressureImageView.widthAnchor.constraint(equalToConstant: 40),
            pressureImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            windImageView.widthAnchor.constraint(equalToConstant: 40),
            windImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            humidityImageView.widthAnchor.constraint(equalToConstant: 40),
            humidityImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }

}


// MARK: - NameSpaces

private enum WeatherString {
    static let highestTemp = "최고"
    static let lowestTemp = "최저"
    static let feelTemp = "체감"
    static let pressure = "기압"
    static let wind = "풍속"
    static let humidity = "습도"
    
    enum Images {
        static let pressure = "dial.max"
        static let wind = "wind"
        static let humidity = "humidity.fill"
    }
    
    enum Units {
        static let pressure = "hpa"
        static let wind = "m/s"
        static let humidity = "%"
    }
}
