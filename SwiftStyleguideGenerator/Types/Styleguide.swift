//
//  Styleguide.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

class Styleguide {
    
    let fileName = "Styleguide.swift"
    
    func generate(destinationDirectory: String){
        
        var styleguide = "class Styleguide: NSObject {\n\n"
        styleguide += "@objc static let colors = Color.self"
        styleguide += "@objc static let cornerRadiuses = CornerRadius.self"
        styleguide += "@objc static let fontSizes = FontSizes.self"
        styleguide += "\n\n}"
        
        File.write(string: styleguide, filePath: "\(destinationDirectory)\(fileName)")
        
    }
    
}