Pod::Spec.new do |spec|
  spec.name         = 'FreestylerCore'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  spec.homepage     = 'https://github.com/cayugasoft/FreestylerCore'
  spec.authors      = { 'Alexander Doloz' => 'adoloz@cayugasoft.com' }
  spec.summary      = 'Swift 3 framework for styling.'
  spec.source       = { :git => 'https://github.com/cayugasoft/FreestylerCore.git', :tag => "#{spec.version.to_s}" }

  spec.ios.deployment_target  = '8.0'

  spec.source_files       = 'Source/**/*.swift'

  spec.ios.framework  = 'UIKit'
end