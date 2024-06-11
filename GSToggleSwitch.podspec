#
# Be sure to run `pod lib lint ToggleSwitch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GSToggleSwitch'
  s.version          = '0.1.0'
  s.summary          = 'An animate switch collection, Add Beautiful Customise Switch in your application to boost UI and UX.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The ToggleSwitch library is a lightweight and easy-to-use solution for implementing customizable toggle switches in your iOS, MacOS and AppleVision projects. Designed to offer a visually appealing and interactive way to represent binary states (like on/off), this library is ideal for enhancing user interfaces with intuitive toggle controls.
                       DESC

  s.homepage         = 'https://github.com/megaganjotsingh/GSToggleSwitch'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'megaganjotsingh' => 'megaganjotsingh@gmail.com' }
  s.source           = { :git => 'https://github.com/megaganjotsingh/GSToggleSwitch.git', :tag => s.version.to_s }
  # s.social_media_url = 'www.linkedin.com/in/gaganjot-singh-40b40b100'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'Classes/**/*'
  
  # s.resource_bundles = {
  #   'ToggleSwitch' => ['ToggleSwitch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
