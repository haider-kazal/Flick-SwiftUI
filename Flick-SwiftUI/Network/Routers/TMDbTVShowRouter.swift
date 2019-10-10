//
//  TMDbTVShowRouter.swift
//  Flick-SwiftUI
//
//  Created by Haider Kazal on 11/10/19.
//  Copyright © 2019 Haider Ali Kazal. All rights reserved.
//

import Alamofire
import Foundation

enum TMDbTVShowRouter: TMDbBaseRouter {
    case credits(forID: Int)
    case details(forID: Int)
    case images(forID: Int)
    case videos(forID: Int)

    var commonPathExtension: String { "/3/tv" }
    
    var path: String {
        switch self {
        case let .credits(id):
            return "/\(id)/credits"
            
        case let .details(id):
            return "/\(id)"
        
        case let .images(id):
            return "/\(id)/images"
            
        case let .videos(id):
            return "/\(id)/videos"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var queries: [String: String]? {
        return nil
    }
    
    var body: Parameters? { nil }
    
    var headers: HTTPHeaders? { nil }
    
    var bodyEncoder: ParameterEncoding? { URLEncoding.default }
}
