Pod::Spec.new do |s|

  s.name             = 'RowModel'
  s.version          = '0.1.0'
  s.summary          = 'Build simple CRUD iOS apps in 10 minutes or less.'
  s.homepage         = 'https://github.com/istx25/RowModel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Willow Alexandra' => 'willow.alexandra@icloud.com' }
  s.source           = { :git => 'https://github.com/istx25/RowModel.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/istx25'
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/**/*'
  s.frameworks = 'UIKit'

end
