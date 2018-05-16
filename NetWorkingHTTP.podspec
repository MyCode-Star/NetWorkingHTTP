Pod::Spec.new do |s|
  s.name         = "NetWorkingHTTP" 
  s.version      = "1.0.0"     
  s.license      = "MIT"       
  s.summary      = "网络库，后面会有具体的完善，还希望大家多多支持,多多Star，谢谢"

  s.homepage     = "https://github.com/MyCode-Star/NetWorkingHTTP" 
  s.source       = { :git => "https://github.com/MyCode-Star/NetWorkingHTTP.git", :tag => "#{s.version}" }
  s.source_files = "NetWorkingHTTP/*.{h,m}"
  s.requires_arc = true 
  s.platform     = :ios, "7.0" 
  s.frameworks   = "UIKit", "Foundation"
  s.author             = { "白仕云" => "baishiyun@163.com" } 
  s.social_media_url   = "https://github.com/baishiyun" 

end