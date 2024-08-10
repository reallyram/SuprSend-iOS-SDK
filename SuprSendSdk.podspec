Pod::Spec.new do |spec|
  spec.name         = "SuprSendSdk"
  spec.version      = "1.0.3"
  spec.summary      = "SuprSend SDK"
  spec.description  = "This is SuprSend SDK for iOS"
  spec.homepage     = "https://github.com/suprsend/SuprSend-iOS-SDK"
  spec.author       = { "Ram Suthar" => "reallyram@gmail.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"
  spec.source       = { :git => "https://github.com/reallyram/SuprSend-iOS-SDK.git", :tag =>  "1.0.3" }
  spec.vendored_frameworks = "SuprSendSdk.xcframework"
end
