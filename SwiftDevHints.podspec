Pod::Spec.new do |s|
  s.name             = 'SwiftDevHints'
  s.version          = '2.3.3'
  s.summary          = 'A very useful set of development tools.'
 
  s.description      = <<-DESC
                       SwiftDevHints is a very useful set of development tools.
                       DESC
 
  s.homepage         = 'https://github.com/derekcoder/SwiftDevHints'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'derekcoder' => 'derekcoder@gmail.com' }
  s.source           = { :git => 'https://github.com/derekcoder/SwiftDevHints.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.source_files = ["SwiftDevHints/Classes/**/*", "SwiftDevHints/SwiftDevHints.h"]
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.swift_version = '5.0'
  
end
