//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    
    private let cities = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    private var weatherOfCity: [WeatherInformation] = []
    
    private lazy var weatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        layout.itemSize = CGSize(width: 160, height: 180)
        let collecionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collecionView.translatesAutoresizingMaskIntoConstraints = false
        return collecionView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollectionView()
        getCurrentWeather(cities: cities)
    }
    
    // MARK: - Methods
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(weatherCollectionView)
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            weatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func configureCollectionView() {
        weatherCollectionView.dataSource = self
        weatherCollectionView.delegate = self
        weatherCollectionView.register(WeatherCollectionViewCell.self,
                                       forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
    }
    
    func getCurrentWeather(cities: [String]) {
        cities.forEach { city in
            
            URLSessionManager.shared.fetchCurrentWeather(cityName: city) { (response) in
                switch response {
                case .success(let weatherData):
                    self.weatherOfCity.append(weatherData)
                    DispatchQueue.main.async {
                        if !self.weatherOfCity.isEmpty {
                            self.weatherCollectionView.reloadData()
                        }
                    }
                case .failure(let error):
                    print("current weather response failure: \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - @objc
    
    
}

// MARK: - Extensions

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherOfCity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as? WeatherCollectionViewCell else { return WeatherCollectionViewCell() }
        
        cell.configureCell(weatherOfCity: weatherOfCity[indexPath.row])
        
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let weatherDetailVC = WeatherDetailViewController()
        
        navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
}
