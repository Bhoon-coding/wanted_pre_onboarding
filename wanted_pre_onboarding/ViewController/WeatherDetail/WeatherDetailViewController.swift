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
    
    private lazy var etcHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    private lazy var etcVerticalWrapper: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.backgroundColor = .magenta
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var etcTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "풍속"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var etcImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wind")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var etcDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "4 m/s"
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
         etcVerticalWrapper
        ].forEach { view.addSubview($0) }
        
        [etcTitleLabel,
         etcImageView,
         etcDetailLabel
        ].forEach { etcVerticalWrapper.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            wholeWrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wholeWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            wholeWrapper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            wholeWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            weatherIconImageView.topAnchor.constraint(equalTo: wholeWrapper.safeAreaLayoutGuide.topAnchor, constant: 60),
            weatherIconImageView.leadingAnchor.constraint(equalTo: wholeWrapper.leadingAnchor),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 140),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: weatherIconImageView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tempWrapper.topAnchor.constraint(equalTo: weatherIconImageView.topAnchor),
            tempWrapper.trailingAnchor.constraint(equalTo: wholeWrapper.trailingAnchor),
            tempWrapper.widthAnchor.constraint(equalTo: weatherIconImageView.widthAnchor),
            tempWrapper.heightAnchor.constraint(equalTo: weatherIconImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentTempLabel.centerYAnchor.constraint(equalTo: weatherIconImageView.centerYAnchor),
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
            feelTempLabel.topAnchor.constraint(equalTo: descriptionLabel.topAnchor),
            feelTempLabel.centerXAnchor.constraint(equalTo: tempWrapper.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            etcVerticalWrapper.leadingAnchor.constraint(equalTo: wholeWrapper.leadingAnchor),
            etcVerticalWrapper.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            etcVerticalWrapper.widthAnchor.constraint(equalToConstant: 80),
            etcVerticalWrapper.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            etcTitleLabel.centerXAnchor.constraint(equalTo: etcVerticalWrapper.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
        
        ])
        
        NSLayoutConstraint.activate([
        
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
