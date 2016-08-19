#
# Be sure to run `pod lib lint FreestylerCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FreestylerCore'
  s.version          = '0.3.0'
  s.summary          = 'FreestylerCore lets you create and reuse styles using lightweight syntax.'

  s.description      = <<-DESC
  FreestylerCore is the core collection of classes, enums and protocols which make possible to create and reuse *styles* and apply them to `UIView`s and `UIBarItem`s.
DESC

  s.homepage         = 'https://github.com/cayugasoft/FreestylerCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexander Doloz' => 'adoloz@cayugasoft.com' }
  s.source           = { :git => 'https://github.com/cayugasoft/FreestylerCore.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'FreestylerCore/Sources/**/*'
end
