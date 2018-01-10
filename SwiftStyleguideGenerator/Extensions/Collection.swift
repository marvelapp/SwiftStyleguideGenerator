//
//  Collection.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 10/01/2018.
//  Copyright © 2018 MarvelPrototyping. All rights reserved.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
