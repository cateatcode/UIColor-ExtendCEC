#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "UIColor+ExtendCEC"
  s.version          = "0.1.0"
  s.summary          = "Common UIColor operates."
  s.description      = <<-DESC
                       1.color with HEX
                       2.color with HEXString
                       3.color with RGB
                       DESC
  s.homepage         = "https://github.com/cateatcode/UIColor+ExtendCEC"
  s.license          = 'MIT'
  s.author           = { "qiang.xu" => "cateatcode@gmail.com" }
  s.source           = { :git => "https://github.com/cateatcode/UIColor+ExtendCEC.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '5.0'
  s.requires_arc = false

  s.source_files = 'Classes/*.{h,m}'

  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
