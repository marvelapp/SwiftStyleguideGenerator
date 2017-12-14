# Swift Styleguide Generator
Executable for generating a Swift styleguide from a JSON file. The theme config works nicely with libraries like [styled-system](https://github.com/jxnblk/styled-system) and apps like [Compositor Lab](compositor.io/lab).

<img src="/Github/GithubHeader.png?raw=true" width="888">

### Dependencies

Install dependencies by running **Install.sh**

### Build Phases
Use the executable in a Run Script in your Build Phases to keep your styleguide up to date.
Eg: ./SwiftStyleguideGenerator [THEME_JSON_PATH] [DESTINATION_FOLDER] --platform iOS
