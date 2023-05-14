//
//  UIViewEx.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2023/05/14.
//

import UIKit

extension UIView {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, height: CGFloat) {
        for edge in arr_edge {
            let border = UIView()
            border.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(border)
            switch edge {
            case UIRectEdge.top:
                NSLayoutConstraint.activate([
                    border.topAnchor.constraint(equalTo: self.topAnchor),
                    border.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    border.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    border.heightAnchor.constraint(equalToConstant: 1)
                ])
                break
            case UIRectEdge.bottom:
                NSLayoutConstraint.activate([
                    border.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                    border.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    border.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    border.heightAnchor.constraint(equalToConstant: 1)
                ])
                break
            case UIRectEdge.left:
                NSLayoutConstraint.activate([
                    border.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                    border.topAnchor.constraint(equalTo: self.topAnchor),
                    border.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    border.widthAnchor.constraint(equalToConstant: 1)
                ])
                break
            case UIRectEdge.right:
                NSLayoutConstraint.activate([
                    border.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                    border.topAnchor.constraint(equalTo: self.topAnchor),
                    border.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    border.widthAnchor.constraint(equalToConstant: 1)
                ])
                break
            default:
                break
            }
            border.backgroundColor = color
        }
    }
}

