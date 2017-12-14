//
//  colors.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

class Colors {
    
    var platform: Platform = .iOS
    
    init(platform: Platform){
        self.platform = platform
    }
    
    func generate(json: [String: Any], destinationDirectory: String){
        
        guard let colors = json["colors"] as? [String: String] else {
            print("❌ No colors found in JSON.".f.Red)
            exit(1)
        }
        
        var fileString = "class Color: NSObject {\n\n"
        
        var colorClass = "UIColor"
        switch platform {
        case .iOS:
            colorClass = "UIColor"
        case .watchOS:
            colorClass = "UIColor"
        case .tvOS:
            colorClass = "UIColor"
        case .macOS:
            colorClass = "NSColor"
        }
        
        for (key, value) in colors {
            fileString += "@objc static let \(key) = \(colorClass)(hex: \"\(value)\")\n"
        }
        
        fileString += "\n\n}"
        
        File.write(string: fileString, filePath: "\(destinationDirectory)Colors.swift")
        
    }
    
}
