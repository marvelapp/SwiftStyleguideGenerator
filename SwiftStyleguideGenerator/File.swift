//
//  File.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

struct File {
    
    static func write(string: String, filePath: String){
        
        let url = URL(fileURLWithPath: filePath)
        
        do {
            try string.write(to: url, atomically: false, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Error: \(error.domain)")
            exit(1)
        }
        
    }
    
}
