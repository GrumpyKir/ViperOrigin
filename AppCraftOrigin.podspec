Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "AppCraftOrigin"
s.summary = "Basic classes to work with VIPER arch"
s.requires_arc = true
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Opekishev Kirill" => "grumpykir@gmail.com" }
s.homepage = "https://github.com/TheCodedSelf/RWPickFlavor"
s.source = { :git => "https://github.com/GrumpyKir/ViperOrigin",
:tag => "#{s.version}" }
s.framework = "UIKit"
s.dependency 'ActionSheetPicker-3.0', '~> 2.3.0'
s.source_files = "AppCraftOrigin/**/*.{swift}"
s.resources = "AppCraftOrigin/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
s.swift_version = "4.2"

end
