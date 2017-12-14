//
//  Radiuses.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

class Radiuses {
    
    let fileName = "Radius.swift"
    
    func generate(json: [String: Any], destinationDirectory: String){
        
        guard let radii = json["radii"] as? [String: String] else {
            print("❌ No radiuses found in JSON.".f.Red)
            exit(1)
        }
        
        var fileString = "class Radius: NSObject {\n\n"
        var sizeName = 1
        
        for value in radii {
            fileString += "@objc static let size\(sizeName):CGFloat = \(value)\n"
            sizeName = sizeName + 1
        }
        
        fileString += "\n\n}"
        
        File.write(string: fileString, filePath: "\(destinationDirectory)\(fileName)")
        
    }
    
}
