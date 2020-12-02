
Pod::Spec.new do |s|

  s.name         = "Swift_Form"
  s.version      = "1.0.1"
  s.summary      = "A short description of SwiftyForm."

  s.description  = <<-DESC
  form
                   DESC

  s.homepage     = "https://github.com/jackiehu/"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }


  s.author       = { 'HU' => '814030966@qq.com' }

  s.source       = { :git => 'https://github.com/jackiehu/SwiftyForm.git', :tag => s.version.to_s }



  s.ios.deployment_target = "11.0" 
  s.swift_versions     = ['5.0','5.1','5.2']
  s.requires_arc = true

  s.frameworks   = "UIKit"
  s.dependency 'SnapKit'
  s.source_files = 'Sources/**/*'

end
