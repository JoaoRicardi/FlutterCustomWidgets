### Dependencies

- Add to pubspec the dependencies below:

path_provider: ^1.3.0
image_picker: ^0.6.1+4

### Setup the iOS configuration to use Camera permission

Image Picker plugin for Flutter #
pub package

A Flutter plugin for iOS and Android for picking images from the image library, and taking new pictures with the camera.

Note: This plugin is still under development, and some APIs might not be available yet. Feedback welcome and Pull Requests are most welcome!

Installation #
First, add image_picker as a dependency in your pubspec.yaml file.

iOS #
Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:

NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library. This is called Privacy - Photo Library Usage Description in the visual editor.
NSCameraUsageDescription - describe why your app needs access to the camera. This is called Privacy - Camera Usage Description in the visual editor.
NSMicrophoneUsageDescription - describe why your app needs access to the microphone, if you intend to record videos. This is called Privacy - Microphone Usage Description in the visual editor.



