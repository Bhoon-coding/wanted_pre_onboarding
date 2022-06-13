//
//  WeatherDetailViewController.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2022/06/13.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
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
