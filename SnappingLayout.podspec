#
# Be sure to run `pod lib lint SnappingLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SnappingLayout'
  s.version          = '0.1.0'
  s.summary          = 'UICollectionViewFlowLayout with behaviour to snap the cell when scrolling horizontally.'

  s.description      = <<-DESC
SnappingLayout enables to add a snap behaviour for UICollectionViews.
It works with horizontal scrolling and there are 3 different types: left, center and right.
You can scroll your collection view and it will automatically snap to the chosen position after decelerating.
The snap supports all kinds of collection view configurations: with sectionInset, minimumLineSpacing, contentInset and so forth.
DESC

  s.homepage         = 'https://github.com/getmimo/SnappingLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kévin' => 'kvdesa@gmail.com' }
  s.source           = { :git => 'https://github.com/Kévin/SnappingLayout.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/getmimo'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.source_files = 'SnappingLayout/Classes/**/*'
end
