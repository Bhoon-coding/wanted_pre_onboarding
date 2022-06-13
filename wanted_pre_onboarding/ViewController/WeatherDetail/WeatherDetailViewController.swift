//
//  WeatherDetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/13.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var wholeWrapper: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .brown
        imageView.image = UIImage(systemName: "moon.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨설명"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempWrapper: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var currentTempLabel: UILabel = {
        let label = UILabel()
        label.text = "기온°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.text = "최고°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.text = "최저°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var feelTempLabel: UILabel = {
        let label = UILabel()
        label.text = "체감°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var etcHorizontalWrapper: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .orange
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var pressureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .magenta
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var pressureTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "기압"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pressureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "dial.max")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var pressureDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "1011 hpa"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .magenta
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var windTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "풍속"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wind")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var windDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "4 m/s"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .magenta
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var humidityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "습도"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "humidity.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidityDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "60%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

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
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavigationBar()
    }
    
    // MARK: - Methods
    
    private func configureNavigationBar() {
        title = "도시 이름"
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
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
            weatherIconImageView.topAnchor.constraint(equalTo: wholeWrapper.safeAreaLayoutGuide.topAnchor, constant: 60),
            weatherIconImageView.centerXAnchor.constraint(equalTo: wholeWrapper.centerXAnchor),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 140),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: weatherIconImageView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tempWrapper.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            tempWrapper.centerXAnchor.constraint(equalTo: wholeWrapper.centerXAnchor),
            tempWrapper.widthAnchor.constraint(equalTo: weatherIconImageView.widthAnchor),
            tempWrapper.heightAnchor.constraint(equalTo: weatherIconImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentTempLabel.centerYAnchor.constraint(equalTo: tempWrapper.centerYAnchor),
            currentTempLabel.leadingAnchor.constraint(equalTo: tempWrapper.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            maxTempLabel.topAnchor.constraint(equalTo: tempWrapper.topAnchor, constant: 32),
            maxTempLabel.leadingAnchor.constraint(equalTo: currentTempLabel.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            minTempLabel.topAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 32),
            minTempLabel.leadingAnchor.constraint(equalTo: maxTempLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            feelTempLabel.topAnchor.constraint(equalTo: tempWrapper.bottomAnchor, constant: 16),
            feelTempLabel.centerXAnchor.constraint(equalTo: tempWrapper.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            etcHorizontalWrapper.leadingAnchor.constraint(equalTo: wholeWrapper.leadingAnchor),
            etcHorizontalWrapper.trailingAnchor.constraint(equalTo: wholeWrapper.trailingAnchor),
            etcHorizontalWrapper.topAnchor.constraint(equalTo: feelTempLabel.bottomAnchor, constant: 40),
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
    
    // MARK: - @objc
    
}

// MARK: - Extensions



// 전처리
#if DEBUG

import SwiftUI
@available(iOS 13.0, *)

// UIViewControllerRepresentable을 채택
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    // _ uiViewController: UIViewController로 지정
    func updateUIViewController(_ uiViewController: UIViewController , context: Context) {
        
    }
    // makeui
    func makeUIViewController(context: Context) -> UIViewController {
        // Preview를 보고자 하는 Viewcontroller 이름
        // e.g.)
        
        return WeatherDetailViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        
        // UIViewControllerRepresentable에 지정된 이름.
        Group {
            ViewControllerRepresentable()
            
            // 테스트 해보고자 하는 기기
                .previewDevice("iPhone 11")
        }
    }
}
#endif
