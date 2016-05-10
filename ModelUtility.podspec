Pod::Spec.new do |s|
  s.name             = "ModelUtility"
  s.version          = "1.0.0"
  s.summary          = "JSON transform model framework, support CoreData."

  s.homepage         = "https://github.com/isunimp/ModelUtility"
  s.license          = 'MIT'
  s.authors          = { "isunimp" => "isunimp@gmail.com" }
  s.source           = { :git => "https://github.com/isunimp/ModelUtility.git", :tag => s.version }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'ModelUtility/*.{h,m}'
  s.public_header_files = 'ModelUtility/*.{h}'
  s.frameworks = 'CoreData'

end
