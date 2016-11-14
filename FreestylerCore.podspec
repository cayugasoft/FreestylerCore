Pod::Spec.new do |spec|
  spec.name         = 'FreestylerCore'
  spec.version      = '1.0.1'
  spec.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  spec.homepage     = 'https://github.com/cayugasoft/FreestylerCore'
  spec.authors      = { 'Alexander Doloz' => 'adoloz@cayugasoft.com' }
  spec.summary      = 'Swift 3 framework for styling.'
  spec.description  = "When we develop our applications from designer's mockups, we often encounter the same visual patterns over and over again – colors, fonts, etc. It's wise decision to keep them in one place in your app's code and reuse everywhere. That's exactly what *FreestylerCore* helps you to do."
  spec.source       = { :git => 'https://github.com/cayugasoft/FreestylerCore.git', :tag => "#{spec.version.to_s}" }

  spec.ios.deployment_target  = '8.0'

  spec.source_files       = 'Source/**/*.swift'

  spec.ios.framework  = 'UIKit'
end