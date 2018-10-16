Pod::Spec.new do |s|
  s.name             = 'YECCCategoryKit'
  s.version          = '1.1'
  s.summary          = 'a objc category kit.'
  s.homepage         = 'https://github.com/yecoco/YECCCategoryKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yecoco' => 'yecc759796813@gmail.com' }
  s.source           = { :git => 'https://github.com/yecoco/YECCCategoryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'YECCCategoryKit/Classes/**/*'
  s.requires_arc  = true
  
  # s.resource_bundles = {
  #   'YECCCategoryKit' => ['YECCCategoryKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.private_header_files = "Pod/Classes/**/*.h"
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
