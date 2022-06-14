//
//  WeatherDetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/13.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    let weatherInformation: WeatherInformation

    init(weatherInformation: WeatherInformation) {
        self.weatherInformation = weatherInformation

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIProperties
    
    private lazy var wholeWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = weatherInformation.weather.first?.description
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
        label.text = "\(Int(weatherInformation.temp.temp - 273.15))°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "최고: \(Int(weatherInformation.temp.tempMax - 273.15))°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "최저: \(Int(weatherInformation.temp.tempMin - 273.15))°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var feelTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "체감: \(Int(weatherInformation.temp.feelsLike - 273.15))°"
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
        label.text = "기압"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pressureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "dial.max")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var pressureDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(weatherInformation.temp.pressure) hpa"
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
        label.text = "풍속"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "wind")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var windDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(Int(weatherInformation.wind.speed)) m/s"
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
        label.text = "습도"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "humidity.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidityDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "\(weatherInformation.temp.humidity)%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureUI()
        updateWeatherImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tempWrapper.layer.addBorder([.top],
                                    color: .white,
                                    width: 1.0)
        etcHorizontalWrapper.layer.addBorder([.top],
                                             color: .white,
                                             width: 1.0)
    }
    
    // MARK: - Methods
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "\(weatherInformation.name)"
    }
    
    private func updateWeatherImage() {
        guard let iconCode = weatherInformation.weather.first?.icon else { return }
        let iconUrl = "http://openweathermap.org/img/wn/\(iconCode)@2x.png"
        weatherIconImageView.load(urlString: iconUrl)
    }
    
    // MARK: - @objc
    
}

// MARK: - Extensions

extension WeatherDetailViewController {
    private func configureUI() {
        view.backgroundColor = .systemTeal
    
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
        ].forEach { view.addSubview($0) }
        
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
            wholeWrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wholeWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            wholeWrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            wholeWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
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
