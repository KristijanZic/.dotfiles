# for custom scripts and programs
export PATH="$PATH":"$HOME/bin"

# For Rust
. "$HOME/.cargo/env"
export DYLD_LIBRARY_PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"

export CARGO_TARGET_DIR="$HOME/cargo_target_dir"

# For Flutter
export PATH="$PATH":"$HOME/Library/flutter/bin"
# export PATH="$PATH":"$HOME/Projects/Flutter/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/Library/Android/sdk/emulator"
export PATH="$PATH":"$HOME/Library/Android/sdk/platform-tools"

# Add .NET Core SDK tools
export PATH="$PATH":"$HOME/.dotnet/tools"

# For flutter
# export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"

# export ARGYLL_NOT_INTERACTIVE=1
