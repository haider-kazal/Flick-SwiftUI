//
//  ConnectionManager.swift
//  Flick-SwiftUI
//
//  Created by Haider Kazal on 10/10/19.
//  Copyright © 2019 Haider Ali Kazal. All rights reserved.
//

import Alamofire
import Combine
import Foundation

final class DataConnection {
    private static let tmdbConnectionInterceptor = TMDbConnectionInterceptor()
    
    private static let defaultSession: Session = {
        let session = Session(configuration: .default)
        return session
    }()
    
    private static let tmdbSession: Session = {
        let session = Session(configuration: .default, interceptor: tmdbConnectionInterceptor)
        return session
    }()
    
    private init() { }
    
    static func request(with urlRequest: URLRequestConvertible) -> DataRequest {
        let request = defaultSession.request(urlRequest).validate()
        return request
    }
    
    static func tmdbRequest(with urlRequest: URLRequestConvertible) -> DataRequest {
        let request = tmdbSession.request(urlRequest).validate()
        return request
    }
    
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    static func publisher(for urlRequest: URLRequestConvertible) -> AnyPublisher<DataRequest, Never> {
        let request = defaultSession.request(urlRequest).validate()
        return Just(request).eraseToAnyPublisher()
    }
}
