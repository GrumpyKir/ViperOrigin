Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "AppCraftOrigin"
s.summary = "Basic classes to work with VIPER arch"
s.requires_arc = true
s.version = "0.3.2"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Opekishev Kirill" => "grumpykir@gmail.com" }
s.homepage = "https://github.com/GrumpyKir/ViperOrigin"
s.source = { :git => "https://github.com/GrumpyKir/ViperOrigin.git",
			 :tag => "#{s.version}" }
s.framework = "UIKit"
s.source_files = "AppCraftOrigin/SourceData/**/*.swift"
s.swift_version = "4.2"

end
