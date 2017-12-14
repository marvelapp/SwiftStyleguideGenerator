//
//  FileStyleguideVars.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

struct FileStyleguideVars {
    
    static func read(path: String) -> [String: Any]{
        
        let filePath = "../../../Modules/marveloucss/variables2.json"
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            print("❌ Couldn't get styleguide vars json.".f.Red)
            exit(1)
        }
        
        guard let jsonResult = try? JSONSerialization.jsonObject(with: data)  else {
            print("❌ Couldn't serialise the styleguide json.".f.Red)
            exit(1)
        }
        
        guard let json = jsonResult as? [String: Any] else {
            print("❌ JSON is not [String: Any].".f.Red)
            exit(1)
        }
        
        return json
        
    }
    
}
