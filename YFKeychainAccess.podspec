Pod::Spec.new do |s|

  s.name = "YFKeychainAccess"
  s.version = "1.0"

  s.summary      = "Convenient, beautiful and easy to use KeychainAccess, that written in Swift"

  s.homepage     = "https://github.com/YuriFox/YFKeychainAccess"
  
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "YuriFox" => "yuri17fox@gmail.com" }

  # s.social_media_url   = "http://twitter.com/YuriFox"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/YuriFox/YFKeychainAccess.git", :tag => "#{s.version}" }
  # s.source_files = "Source/*.swift"
  s.ios.vendored_frameworks = 'Framework/YFKeychainAccess.framework'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

end
