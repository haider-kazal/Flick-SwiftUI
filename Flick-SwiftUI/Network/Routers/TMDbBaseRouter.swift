//
//  TMDbBaseRouter.swift
//  Flick-SwiftUI
//
//  Created by Haider Kazal on 11/10/19.
//  Copyright © 2019 Haider Ali Kazal. All rights reserved.
//

import Alamofire
import Foundation

protocol TMDbBaseRouter: BaseRouter { }

extension TMDbBaseRouter {
    var baseURL: URL { URL(string: "https://api.themoviedb.org")! }
}
