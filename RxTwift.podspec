#
# Be sure to run `pod lib lint RxTwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RxTwift"
  s.version          = "0.1.0"
  s.summary          = "A type safe Twitter API client constructed on RxSwift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       A type safe Twitter API client constructed on RxSwift.
                       It is written in pure Swift.
                       DESC

  s.homepage         = "https://github.com/mihyaeru21/RxTwift"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mihyaeru" => "mihyaeru21@gmail.com" }
  s.source           = { :git => "https://github.com/mihyaeru21/RxTwift.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RxTwift' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxSwift', '~> 2.0'
  s.dependency 'CryptoSwift', '~> 0.2'
  s.dependency 'Argo', '~> 2.2'
  s.dependency 'Curry', '~> 1.4'
end
