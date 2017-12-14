//
//  FontSizes.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

class FontSizes {
    
    let fileName = "FontSizes.swift"
    
    func generate(json: [String: Any], destinationDirectory: String){
        
        guard let fontSizes = json["fontSizes"] as? [String: String] else {
            print("❌ No fontSizes found in JSON.".f.Red)
            exit(1)
        }
        
        var fileString = "class FontSizes: NSObject {\n\n"
        var sizeName = 1
        
        for value in fontSizes {
            fileString += "@objc static let size\(sizeName):CGFloat = \(value)\n"
            sizeName = sizeName + 1
        }
        
        fileString += "\n\n}"
        
        File.write(string: fileString, filePath: "\(destinationDirectory)\(fileName)")
        
    }
    
}
