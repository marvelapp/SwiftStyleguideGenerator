# Swift Styleguide Generator
<img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-FFC82C.svg" style="max-height: 300px;" alt="Platform: iOS | macOS | watchOS | tvOS"><a href="https://developer.apple.com/swift/"> <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat" style="max-height: 300px;" alt="Swift"/></a> <a href="http://twitter.com/marvelapp"><img src="https://img.shields.io/badge/Twitter-@marvelapp-blue.svg?style=flat" style="max-height: 300px;" alt="Marvel App"/></a>

Executable for generating a Swift styleguide from a JSON file. The theme config works nicely with libraries like [styled-system](https://github.com/jxnblk/styled-system) and apps like [Compositor Lab](compositor.io/lab).

<img src="/Github/GithubHeader.png?raw=true" width="888">

### Dependencies

Install dependencies by running **Install.sh**

### Supports
- Colors
- Radiuses
- Font Sizes
- Fonts

### How to install
1. Store your theme.json in a git repository
2. Add the theme repo as git submodule to your Swift project.
3. Store the SwiftStyleguideGenerator executable in your project.
4. Add a script build phase to your project settings in Xcode (see below).
5. Add the files the SwiftStyleguideGenerator added in the destination folder to your project.

### Build Phases
Use the executable in a Run Script in your Build Phases to keep your styleguide up to date.

```./SwiftStyleguideGenerator [THEME_JSON_PATH] [DESTINATION_FOLDER] --platform iOS```
