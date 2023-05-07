//
//  API.swift
//  wanted_pre_onboarding
//
//  Created by BH on 2023/05/06.
//

import Foundation

import Alamofire
import RxSwift

struct APICommon {
    static let host: String = Bundle.main.object(forInfoDictionaryKey: "SERVER_HOST") as! String
}

enum Data {
    struct Version {}
}

public protocol APIDefinition {
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var method: HTTPMethod { get }
}

public extension APIDefinition {
    static var rx: Reactive<Self>.Type {
        get { Reactive<Self>.self }
        set {}
    }

    var rx: Reactive<Self> {
        get { Reactive(self) }
        set {}
    }
}
