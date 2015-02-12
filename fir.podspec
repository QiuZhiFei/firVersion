
Pod::Spec.new do |s|
  s.name             = "fir"
  s.version          = "0.0.1"
  s.summary          = " fir auto "
  s.description      = <<-DESC
                       It is a marquee view used on iOS, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/wangzz/WZMarqueeView"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "qiuzhifei" => "qiuzhifei521@gmail.com" }
  s.source           = { :git => "https://github.com/QiuZhiFei/firVersion.git", :tag => s.version.to_s }

  s.platform     = :ios, '4.3'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'firVersion/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end
