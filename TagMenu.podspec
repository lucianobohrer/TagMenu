#
# Be sure to run `pod lib lint TagMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TagMenu'
  s.version          = '1.0.0'
  s.summary          = 'A SwiftUI horizontal tag menu.'

  s.description      = <<-DESC
A SwiftUI horizontal tag menu, with single and multiple selection options, totally customizable
                       DESC

  s.homepage         = 'https://github.com/lucianobohrer/TagMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lucianobohrer' => 'bohrerluciano@gmail.com' }
  s.author           = { 'gabrielsilveiraa' => 'gabi.msilveira@gmail.com' }
  s.source           = { :git => 'https://github.com/lucianobohrer/TagMenu.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/**/*.swift'
  #s.resources = 'Assets/**/*.{lproj,storyboard,xcdatamodeld,xib,xcassets,json,ttf, png}'

  #s.resource_bundles = {
  #  'TagMenu' => ['Assets/**/*']
  #}
   
  s.frameworks = 'UIKit', 'SwiftUI'
end
