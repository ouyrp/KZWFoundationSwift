#
# Be sure to run `pod lib lint KZWFoundationSwfit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KZWFoundationSwfit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of KZWFoundationSwfit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ouyrp/KZWFoundationSwfit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ouyrp' => 'rp.ouyang001@bkjk.com' }
  s.source           = { :git => 'https://github.com/ouyrp/KZWFoundationSwfit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'

  s.source_files = 'KZWFoundationSwfit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KZWFoundationSwfit' => ['KZWFoundationSwfit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
