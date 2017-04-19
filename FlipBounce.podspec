#
# Be sure to run `pod lib lint FlipBounce.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlipBounce'
  s.version          = '1.0.0'
  s.summary          = 'Flip A Bounced.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        Flip A Bounced Flip A Bounced Flip A Bounced
                       DESC

  s.homepage         = 'https://github.com/MJHee/FlipBounce'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MJHee' => '2372621687@qq.com' }
  s.source           = { :git => 'https://github.com/MJHee/FlipBounce.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FlipBounce/Classes/**/*'
  
  s.resource_bundles = {
    'FlipBounce' => ['FlipBounce/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'Masonry', '~> 1.0.1'
end
