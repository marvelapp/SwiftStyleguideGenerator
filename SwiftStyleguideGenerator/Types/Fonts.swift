//
//  Fonts.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 10/01/2018.
//  Copyright © 2018 MarvelPrototyping. All rights reserved.
//

import Foundation

class Fonts {

    let fileName = "Fonts.swift"

    func generate(fontsDirectory: String, destinationDirectory: String){

        var finalFileString = "class FontSizes: NSObject {\n\n"

        let fileManager = FileManager.default
        let baseUrl: URL = URL(fileURLWithPath: fontsDirectory)

        fileManager.enumerator(atPath: fontsDirectory)?.forEach({ (file) in

            guard let fileName = file as? String else {
                return
            }

            let relativeURL = URL(fileURLWithPath: fileName, relativeTo: baseUrl)

            // Skip non fonts files (eg. license files...)
            guard relativeURL.pathExtension == "ttf" || relativeURL.pathExtension == "otf" else {
                return
            }

            guard let operatingSystemName = loadFontName(for: relativeURL) else {
                return
            }

            let cleanFontSwiftName = removeSpecialCharsFromString(text: relativeURL.deletingPathExtension().lastPathComponent)

            finalFileString += "@objc static let \(cleanFontSwiftName.lowercasingFirstLetter()) = \"\(operatingSystemName)\"\n"

        })

        finalFileString += "\n}"

        File.write(string: finalFileString, filePath: "\(destinationDirectory)\(fileName)")

    }

    func loadFontName(for file: URL) -> String? {

        guard let data = try? Data(contentsOf: file) else {
            return nil
        }

        guard let provider = CGDataProvider(data: data as CFData) else {
            return nil
        }

        let font = CGFont(provider)

        guard let name = font.postScriptName else {
            return nil
        }

        return name as String

    }

    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(text.filter {okayChars.contains($0) })
    }

}
