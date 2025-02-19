#
# Be sure to run `pod lib lint OnDocCalendar-iOS-Pod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OnDocCalendar-iOS-Pod'
  s.version          = '0.1.1'
  s.summary          = 'A short description of OnDocCalendar-iOS-Pod.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ONDOC/OnDocCalendar-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '3684453' => 'r@resrom.com' }
  s.source           = { :git => 'https://github.com/ONDOC/OnDocCalendar-iOS', :branch => 'cocoapods' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'

  s.source_files = 'OnDocCalendar-iOS-Pod/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OnDocCalendar-iOS-Pod' => ['OnDocCalendar-iOS-Pod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
