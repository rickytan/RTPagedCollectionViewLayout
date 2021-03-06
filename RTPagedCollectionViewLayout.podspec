#
# Be sure to run `pod lib lint RTPagedCollectionViewLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RTPagedCollectionViewLayout"
  s.version          = "0.1.1"
  s.summary          = "A paged collection view"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
                       A paged collection view for listing a set of items to picking, sorting
                       from left to right, top to bottom, and scroll from left to right
                       DESC

  s.homepage         = "https://github.com/rickytan/RTPagedCollectionViewLayout"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "benfen" => "benfen@mogujie.com" }
  s.source           = { :git => "https://github.com/rickytan/RTPagedCollectionViewLayout.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  # s.resource_bundles = {
  #   'RTPagedCollectionViewLayout' => ['Pod/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
