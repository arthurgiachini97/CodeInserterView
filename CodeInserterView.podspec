#
# Be sure to run `pod lib lint CodeInserterView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CodeInserterView'
  s.version          = '0.1.0'
  s.summary          = 'CodeInserterView is a pod that offers a prompt code inserter, which you can put from 1 to 8 text fields'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters     below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'CodeInserterView is a dynamic code inserter, with automatic jump and return to the next field, where the user can input the code that he will receive.'
                       DESC

  s.homepage         = 'https://github.com/arthurgiachini97/CodeInserterView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Arthur Giachini' => 'arthur.giachini@acad.pucrs.br' }
  s.source           = { :git => 'https://github.com/arthurgiachini97/CodeInserterView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
 
  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios" => "12.0"
  }
  
  # s.resource_bundles = {
  #   'CodeInserterView' => ['CodeInserterView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
