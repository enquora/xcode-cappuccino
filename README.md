# cappuccino-xcode-plugin

This plugin is provided as-is with no guarantees of any kind.

Syntax highlighting is from original xclangspec created by Raphael Bartolome:
https://github.com/rbartolome/xcode-cappuccino
It is a work-in-progress - a copy of the Objective-C xclangspec is included from Xcode 12.3 for reference (but not installed).
Xcode has adopted the [Language Server Protocol for C, C++ and Objective-C](https://github.com/apple/sourcekit-lsp), but does not yet use it for syntax highlighting.
Development of an Objective-J LSP server would allow implementation of code-completion, refactoring and other beneficial features.

Plugin and installer guided by:
https://github.com/youknowone/rust-xcode-langspec
https://github.com/steventroughtonsmith/lua-xclangspec
https://github.com/BrainiumLLC/rust-xcode-plugin
https://github.com/touchlab/xcode-kotlin

From Xcode 8 onwards, Xcode plugins must be code-signed by Apple, with the exception of those for language syntax colouring.
Even those must conform to a plugin registration scheme, which must also include the app UUID for supported versions of Xcode.

If  Xcode UUID is not listed [here](https://github.com/enquora/xcode-cappuccino/blob/main/Plug-ins/Objective-J.ideplugin/Contents/Info.plist), please create an issue (or preferably a pull request!).

The UUID for the requested UUID must be provided when creating an issue and can be found with this command:
```sh
$ defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
```
The UUID can also be immediately added to the above-referenced Info.plist.
Once added, execute the `setup.sh` script using sudo.

Xcode must be restarted if already loaded.
A `Load Bundle` button in a popup that should appear automatically.

## Manual Install
Place the `Plug-ins` folders in `~/Library/Developer/Xcode`

Place the `Objective-J.xclangspec` in `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications`

Place `Xcode.SourceCodeLanguage.Objective-J.plist` in `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata`
