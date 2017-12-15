# Swift Styleguide Generator
<img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-FFC82C.svg" style="max-height: 300px;" alt="Platform: iOS | macOS | watchOS | tvOS"><a href="https://developer.apple.com/swift/"> <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat" style="max-height: 300px;" alt="Swift"/></a> <a href="http://twitter.com/marvelapp"><img src="https://img.shields.io/badge/Twitter-@marvelapp-blue.svg?style=flat" style="max-height: 300px;" alt="Marvel App"/></a>

Executable for generating a Swift styleguide from a JSON file. The theme config works nicely with libraries like [styled-system](https://github.com/jxnblk/styled-system) and apps like [Compositor Lab](compositor.io/lab).

### Supports
- Colors
- Radiuses
- Font Sizes
- Fonts

### Step 1: Installation

Install it with this command inside your terminal:

```
curl -sL https://raw.githubusercontent.com/marvelapp/SwiftStyleguideGenerator/master/Install.sh | bash
```

### Step 2: Create a theme.json
Store your theme.json somewhere.
This could be on Github so you can always fetch the latest theme file using git submodules.
Or if you prefer it to be a static file, you can store it inside your project repo.

### Step 3: Build Phases
Use the executable in a Run Script in your Build Phases to keep your styleguide up to date.

```
SwiftStyleguideGenerator [THEME_JSON_PATH] [DESTINATION_FOLDER] --platform iOS
```

### Step 4: Run your project once
This will generate your Swift styleguide files for the first time.

### Step 5: Add files to project
Now check the destination folder and drag the styleguide files inside your Xcode project.
You are now ready to use the styleguide. By using:
- Styleguide.colors.tomato or [Styleguide.colors tomato];
- Styleguide.fontSizes.size1 or [Styleguide.fontSizes size1];
- Styleguide.radiuses.size2 or [Styleguide.radiuses size2];

### Compiling yourself

Install dependencies by running **Dependencies.sh**
