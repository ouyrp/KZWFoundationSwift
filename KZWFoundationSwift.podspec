#
# Be sure to run `pod lib lint KZWFoundationSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'KZWFoundationSwift'
    s.version          = '1.0.1'
    s.summary          = 'A short description of KZWFoundationSwift.'
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/ouyrp/KZWFoundationSwift'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ouyrp' => 'rp.ouyang001@bkjk.com' }
    s.source           = { :git => 'https://github.com/ouyrp/KZWFoundationSwift.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    s.swift_version = '4.0'
    s.source_files = 'KZWFoundationSwift/Classes/*.swift'
    
end
