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
        
        var styleguide = "public class Styleguide: NSObject {\n\n"
        styleguide += "@objc public static let colors = Color.self\n"
        styleguide += "@objc public static let radiuses = Radius.self\n"
        styleguide += "@objc public static let fontSizes = FontSizes.self\n"
        styleguide += "@objc public static let fonts = Fonts.self\n"
        styleguide += "\n\n}"
        
        File.write(string: styleguide, filePath: "\(destinationDirectory)\(fileName)")
        
    }
    
}
