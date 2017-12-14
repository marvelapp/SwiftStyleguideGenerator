//
//  main.swift
//  SwiftStyleguideGenerator
//
//  Created by Maxime De Greve on 14/12/2017.
//  Copyright © 2017 MarvelPrototyping. All rights reserved.
//

import Foundation

enum Platform: String {
    case macOS = "macOS"
    case iOS = "iOS"
    case watchOS = "watchOS"
    case tvOS = "tvOS"
}

guard let platformValue = Args.parsed.flags["platform"] else {
    print("❌ Provide a platform.".f.Red)
    print(Help.command.f.Red)
    exit(1)
}

guard let platform = Platform(rawValue: platformValue)else {
    print("❌ Provide a valid platform.".f.Red)
    print(Help.command.f.Red)
    exit(1)
}

let fileStyleguideVarsPath = Args.parsed.parameters[0]
var destinationDirectory = Args.parsed.parameters[1]

// Make sure path has a last slash
if destinationDirectory.last != "/" {
    destinationDirectory.append("/")
}

print("🔮  Starting generating your Styleguide...".f.Green)

let json = FileStyleguideVars.read(path: fileStyleguideVarsPath)

print("🎨  Generating color file...".f.Green)
Colors().generate(json: json, destinationDirectory: destinationDirectory, platform: platform)

print("⚪️  Generating radius file...".f.Green)
Radiuses().generate(json: json, destinationDirectory: destinationDirectory)

print("🖌  Generating font sizes file...".f.Green)
FontSizes().generate(json: json, destinationDirectory: destinationDirectory)

print("📦  Generating styleguide file...".f.Green)
Styleguide().generate(destinationDirectory: destinationDirectory)

print("✌️   Finished generating your styleguide.".f.Green)

