#
# Be sure to run `pod lib lint YunkuPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YunkuPod'
  s.version          = '1.0.5'
  s.summary          = '第五次提交的测试'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
这仅仅是提交的测试
DESC

  s.homepage         = 'https://github.com/yotao/YunkuSwiftSDKTEST'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yotao' => 'yotao@qq.com' }
  s.source           = { :git => 'https://github.com/yotao/YunkuSwiftSDKTEST.git', :tag => s.version.to_s }
#  s.social_media_url = 'http://www.gokuai.com'

  s.ios.deployment_target = '8.0'
#  s.public_header_files = 'Headers/iOS/YunkuSwiftSDK.h'
   s.source_files = 'YunkuSwiftSDK/YunkuSwiftSDK/Class/**/*'
#  s.frameworks = 'YunkuSwiftSDK'
  s.vendored_frameworks = 'Frameworks/iOS/CommonCrypto.framework'



  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
