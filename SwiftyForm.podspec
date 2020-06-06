#
#  Be sure to run `pod s lint SwiftyForm.pods' to ensure this is a
#  valid s and to remove all comments including this before submitting the s.
#
#  To learn more about Pods attributes see https://guides.cocoapods.org/syntax/pods.html
#  To see working Podss in the CocoaPods repo see https://github.com/CocoaPods/ss/
#

Pod::Spec.new do |s|

  s.name         = "SwiftyForm"
  s.version      = "0.0.1"
  s.summary      = "A short description of SwiftyForm."

  s.description  = <<-DESC
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
  
  s.subspec 'Formers' do |ss|
  	  ss.dependency 'SwiftyForm/Core'
      ss.source_files = 'SwiftyForm/Class/Formers/**/*' 
    end
  s.subspec 'Cells' do |ss|
  	  ss.dependency 'SwiftyForm/Formers'
      ss.dependency 'SwiftyForm/Core'
      ss.source_files = 'SwiftyForm/Class/Cells/**/*' 
    end
  s.subspec 'Core' do |ss|
      ss.source_files = 'SwiftyForm/Class/Core/**/*' 
    end
  s.subspec 'HeaderFooters' do |ss|
  	  ss.dependency 'SwiftyForm/Formers'
      ss.dependency 'SwiftyForm/Core'
      ss.source_files = 'SwiftyForm/Class/HeaderFooters/**/*' 
    end
end
