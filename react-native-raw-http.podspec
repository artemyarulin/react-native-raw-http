Pod::Spec.new do |s|
  s.name           = "react-native-raw-http"
  s.version        = "0.0.1"
  s.summary        = "React native library for low level interaction with API for HTTP, such as manual redirect handling and manual cookie management"
  s.homepage       = "https://github.com/artemyarulin/react-native-raw-http"
  s.license        = { :type => 'MIT', :file => 'LICENSE' }
  s.author         = { "Artem Yarulin" => "artem.yarulin@fessguid.com" }
  s.platform       = :ios, "7.0"
  s.source         = { :git => "https://github.com/artemyarulin/react-native-raw-http.git", :tag => s.version.to_s }
  s.source_files   = ["react-native-raw-http/RNMRawHttp.{h,m}"]
  s.public_header_files = "react-native-eval/RNMRawHttp.h"
  s.requires_arc  = true
  s.dependency "React", "> 0.9.0"
end
