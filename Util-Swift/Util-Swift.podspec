Pod::Spec.new do |s|

  s.name            = "Util-Swift"
  s.version         = "0.2.4"
  s.summary         = "This is UtilSwift"
#  s.description    = ""
  s.homepage        = "https://github.com/devgster/Util-Swift"
  # s.screenshots   = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license         = "MIT"

  s.author          = { "devgster" => "devgster@gmail.com" }
  s.platform        = :ios, "10.0"

  s.source          = { :git => "https://github.com/devgster/Util-Swift.git", :tag => "#{s.version}" }

  s.source_files    = "Util-Swift/**/*"

  # s.public_header_files = "Classes/**/*.h"
  s.frameworks      = "CoreTelephony"


end
