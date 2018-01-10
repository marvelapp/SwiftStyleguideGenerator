//
//  colors.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation
import Cocoa

class Colors {
    
    let fileName = "Colors.swift"
    
    func generate(json: [String: Any], destinationDirectory: String){
        
        guard let colors = json["colors"] as? [String: String] else {
            print("❌ No colors found in JSON.".f.Red)
            exit(1)
        }
        
        var fileString = "class Color: NSObject {\n\n"

        fileString += "#if os(OSX)\n\n"

        for (key, value) in colors {
            let valueColor = NSColor.hex(string: value)
            fileString += "// \(value)\n"
            fileString += "@objc static let \(key) = NSColor(red: \(valueColor.redComponent), green: \(valueColor.greenComponent), blue: \(valueColor.blueComponent), alpha: 1)\n\n"
        }

        fileString += "\n#else\n\n"

        for (key, value) in colors {
            let valueColor = NSColor.hex(string: value)
            fileString += "// #\(value)\n"
            fileString += "@objc static let \(key) = UIColor(red: \(valueColor.redComponent), green: \(valueColor.greenComponent), blue: \(valueColor.blueComponent), alpha: 1)\n\n"
        }

        fileString += "\n#endif"

        fileString += "\n\n}"
        
        File.write(string: fileString, filePath: "\(destinationDirectory)\(fileName)")
        
    }
    
}
