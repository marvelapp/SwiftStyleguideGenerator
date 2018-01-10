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

    static func createDir(directoryPath: String){

        let fileManager = FileManager.default
        var isDir : ObjCBool = false

        // Check if directory exists

        if fileManager.fileExists(atPath: directoryPath, isDirectory:&isDir) {

            // Check if existing path is directory

            if isDir.boolValue == false {
                print("❌ There is file already with name Styleguide in your destination folder. Therefore we can't create the Styleguide folder there..".f.Red)
                exit(1)
            }

        } else {

            // Create directory
            do {
                try fileManager.createDirectory(atPath: directoryPath, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                print(error.localizedDescription);
                print("❌ \(error.localizedDescription)".f.Red)
                exit(1)
            }

        }

    }
    
}
