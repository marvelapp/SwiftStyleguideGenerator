//
//  String.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 11/01/2018.
//  Copyright © 2018 MarvelPrototyping. All rights reserved.
//

import Foundation
import Cocoa

extension String {

    func lowercasingFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }

    mutating func lowercasingFirstLetter() {
        self = self.lowercasingFirstLetter()
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

    var camelcaseString: String {
        guard !isEmpty else {
            return ""
        }

        let delimiters = CharacterSet(charactersIn: "_-")
        let pascalcaseString = capitalized.components(separatedBy: delimiters).joined(separator: "")
        return "\(pascalcaseString.substring(to: index(startIndex, offsetBy: 1)).lowercased())\(pascalcaseString.substring(from: index(startIndex, offsetBy: 1)))"
    }

}
