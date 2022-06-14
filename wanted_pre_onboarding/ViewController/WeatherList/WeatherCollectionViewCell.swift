//
//  WeatherCollectionViewCell.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "weatherCollectionViewCell"
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var currentTempLabel: UILabel = {
        let label = UILabel()
        label.text = "현재기온"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentTemp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentHumidityLabel: UILabel = {
        let label = UILabel()
        label.text = "현재습도"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentHumidity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    
    // TODO: [x]  파라미터에 날씨 데이터 넣기
    func configureCell(weatherOfCity: WeatherInformation) {
        guard let iconCode = weatherOfCity.weather.first?.icon,
              let iconUrl = URL(string:    "http://openweathermap.org/img/wn/\(iconCode)@2x.png") else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: iconUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.weatherIconImageView.image = image
                    }
                }
            }
        }
    
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 16
        
        cityLabel.text = weatherOfCity.name
        currentTemp.text = "\(Int(weatherOfCity.temp.temp - 273.15))°"
        currentHumidity.text = "\(weatherOfCity.temp.humidity)%"
        
    }
    
    func configureLayout() {
        
        contentView.addSubview(cityLabel)
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        contentView.addSubview(weatherIconImageView)
        NSLayoutConstraint.activate([
            weatherIconImageView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 16),
            weatherIconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 70),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        contentView.addSubview(currentTempLabel)
        NSLayoutConstraint.activate([
            currentTempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            currentTempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
        
        contentView.addSubview(currentTemp)
        NSLayoutConstraint.activate([
            currentTemp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            currentTemp.centerXAnchor.constraint(equalTo: currentTempLabel.centerXAnchor)
        ])
        
        contentView.addSubview(currentHumidityLabel)
        NSLayoutConstraint.activate([
            currentHumidityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            currentHumidityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        contentView.addSubview(currentHumidity)
        NSLayoutConstraint.activate([
            currentHumidity.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            currentHumidity.centerXAnchor.constraint(equalTo: currentHumidityLabel.centerXAnchor)
        ])
    }
    
}
