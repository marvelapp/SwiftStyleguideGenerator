//
//  Radiuses.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

class Radiuses {
    
    func generate(json: [String: Any], destinationDirectory: String){
        
        guard let radii = json["radii"] as? [String: String] else {
            print("❌ No colors found in JSON.".f.Red)
            exit(1)
        }
        
        var fileString = "class Radius: NSObject {\n\n"

        for (key, value) in radii {
            fileString += "@objc static let \(key):CGFloat = \(value)\n"
        }
        
        fileString += "\n\n}"
        
        File.write(string: fileString, filePath: "\(destinationDirectory)Colors.swift")
        
    }
    
}
