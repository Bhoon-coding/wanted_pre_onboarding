//
//  ViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/11.
//

import UIKit



final class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    
//    private var weatherOfCity: [WeatherInformation] = []
    
    let spinner = SpinnerViewController()
    let viewModel = WeatherViewModel()
    
    
    private lazy var weatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        layout.itemSize = CGSize(width: 160, height: 180)
        let collecionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collecionView.backgroundColor = .systemTeal
        collecionView.translatesAutoresizingMaskIntoConstraints = false
        return collecionView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureUI()
        configureCollectionView()
        createSpinnerView()
        viewModel.getCurrentWeather(cities: viewModel.cities)
        bindUI()
//        getCurrentWeather(cities: cities)
        
    }
    
    // MARK: - Methods
    
    private func bindUI() {
        viewModel.isLoading.subscribe(onNext: { [weak self] bool in
            print("=================== \(#function) bool: \(bool) ===================")
            if bool {
                self?.createSpinnerView()
            } else {
                self?.removeSpinnerView()
                self?.weatherCollectionView.reloadData()
            }
            
        })
        
    }

    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemTeal
    }
    
    private func configureUI() {
        
        view.backgroundColor = .systemTeal
        
        [weatherCollectionView].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
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
    
    private func createSpinnerView() {
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    
    private func removeSpinnerView() {
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
    
//    private func getCurrentWeather(cities: [String]) {
//
//        let workingQueue = DispatchQueue(label: "workingQueue", attributes: .concurrent)
//        let workGroup = DispatchGroup()
//        let defaultQueue = DispatchQueue.main
//
//        cities.forEach {
//            WeatherService()
//                .fetchWeathers(cityName: $0)
//                .observe(on: MainScheduler.instance)
//                .subscribe { [weak self] weather in
//                    self?.weatherOfCity.append(weather)
//                    self?.weatherCollectionView.reloadData()
//                    self?.removeSpinnerView()
//                }
//                .disposed(by: disposeBag)
//
//        }
//
//
////        cities.forEach { city in
////            workGroup.enter()
////            NetworkManager.shared.fetchCurrentWeather(cityName: city) { (response) in
////                switch response {
////                case .success(let weatherData):
////                    workingQueue.async(group: workGroup) {
////                        self.weatherOfCity.append(weatherData)
////                        workGroup.leave()
////                    }
////                case .failure(let error):
////                    print("current weather response failure: \(error.localizedDescription)")
////                }
////            }
////        }
//
//        workGroup.notify(queue: defaultQueue) {
//            self.weatherCollectionView.reloadData()
//            self.removeSpinnerView()
//        }
//    }
    
    // MARK: - @objc
    
    
}

// MARK: - Extensions

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weatherOfCity.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as? WeatherCollectionViewCell else { return WeatherCollectionViewCell() }
        
        cell.configureCell(weatherOfCity: viewModel.weatherOfCity.value[indexPath.row])
        
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let weatherInformation = viewModel.weatherOfCity.value[indexPath.row]
        let weatherDetailVC = WeatherDetailViewController(weatherInformation: weatherInformation)
        let backBarButtonItem = UIBarButtonItem(title: "",
                                                style: .plain,
                                                target: self,
                                                action: nil)
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
}
