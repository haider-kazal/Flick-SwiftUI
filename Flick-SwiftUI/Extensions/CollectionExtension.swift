//
//  CollectionExtension.swift
//  Flick-SwiftUI
//
//  Created by Haider Kazal on 11/10/19.
//  Copyright © 2019 Haider Ali Kazal. All rights reserved.
//

import Foundation

extension Collection {
    subscript(existAt index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
