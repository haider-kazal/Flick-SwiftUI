//
//  TMDbConnectionInterceptor.swift
//  Flick-SwiftUI
//
//  Created by Haider Kazal on 10/10/19.
//  Copyright © 2019 Haider Ali Kazal. All rights reserved.
//

import Alamofire
import Foundation

final class TMDbConnectionInterceptor: RequestInterceptor {
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.addValue(Constants.Credentials.tmdbAPIKey, forHTTPHeaderField: "api_key")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard request.retryCount < 2 else {
            completion(.doNotRetry)
            return
        }
        
        guard let response = request.task?.response as? HTTPURLResponse,
            response.statusCode == 429 else {
                completion(.retry)
                return
        }
        
        completion(.retryWithDelay(1))
    }
}
