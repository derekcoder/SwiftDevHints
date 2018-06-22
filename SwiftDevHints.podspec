Pod::Spec.new do |s|
  s.name             = 'SwiftDevHints'
  s.version          = '1.11.0'
  s.summary          = 'A very useful set of development tools.'
 
  s.description      = <<-DESC
                       SwiftDevHints is a very useful set of development tools.
                       DESC
 
  s.homepage         = 'https://github.com/derekcoder/SwiftDevHints'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'derekcoder' => 'derekcoder@gmail.com' }
  s.source           = { :git => 'https://github.com/derekcoder/SwiftDevHints.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = ['SwiftDevHints/Sources/*.swift', 'SwiftDevHints/SwiftDevHints.h']
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  
end
