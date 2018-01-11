//
//  main.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

guard let fileStyleguideVarsPath = Args.parsed.parameters[safe: 0] else {
    print("❌ No theme.json defined.".f.Red)
    exit(1)
}

guard var destinationDirectory = Args.parsed.parameters[safe: 1] else {
    print("❌ No destination folder defined.".f.Red)
    exit(1)
}

// Make sure path has a last slash
if destinationDirectory.last != "/" {
    destinationDirectory.append("/")
}

print("🔮  Starting generating your Styleguide...".f.Green)

print("📁  Creating Styleguide destination folder...".f.Green)
File.createDir(directoryPath: destinationDirectory)

let json = FileStyleguideVars.read(path: fileStyleguideVarsPath)

print("🎨  Generating color file...".f.Green)
Colors().generate(json: json, destinationDirectory: destinationDirectory)

print("⚪️  Generating radius file...".f.Green)
Radiuses().generate(json: json, destinationDirectory: destinationDirectory)

print("🖌   Generating font sizes file...".f.Green)
FontSizes().generate(json: json, destinationDirectory: destinationDirectory)

print("📦  Generating fonts file...".f.Green)

if let fontsDirectory = Args.parsed.flags["fontsDirectory"]{
    Fonts().generate(fontsDirectory: fontsDirectory, destinationDirectory: destinationDirectory)
} else {
    let varsUrls = URL(fileURLWithPath: fileStyleguideVarsPath)
    Fonts().generate(fontsDirectory: "\(varsUrls.deletingLastPathComponent().path)/fonts", destinationDirectory: destinationDirectory)
}

print("📦  Generating styleguide file...".f.Green)
Styleguide().generate(destinationDirectory: destinationDirectory)

print("✌️   Finished generating your styleguide.".f.Green)

