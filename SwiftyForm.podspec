#
#  Be sure to run `pod spec lint SwiftyForm.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SwiftyForm"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of SwiftyForm."

  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/jackiehu/"

  spec.license      = { :type => 'MIT', :file => 'LICENSE' }


  spec.author             = { 'HU' => '814030966@qq.com' }

  spec.source       = { :git => 'https://github.com/jackiehu/SwiftMesh.git', :tag => s.version.to_s }



  spec.ios.deployment_target = "11.0" 
  spec.swift_versions     = ['5.0','5.1','5.2']
  spec.requires_arc = true

  spec.frameworks   = "UIKit", "Foundation" #支持的框架
  spec.dependency 'SnapKit'
  
  spec.subspec 'CellFormers' do |ss|
      ss.source_files = 'SwiftyForm/Class/CellFormers/**/*' 
    end
  spec.subspec 'Cells' do |ss|
      ss.source_files = 'SwiftyForm/Class/Cells/**/*' 
    end
  spec.subspec 'Formers' do |ss|
      ss.source_files = 'SwiftyForm/Class/Formers/**/*' 
    end
  spec.subspec 'HeaderFooters' do |ss|
      ss.source_files = 'SwiftyForm/Class/HeaderFooters/**/*' 
    end
  spec.subspec 'HederFooterFormers' do |ss|
      ss.source_files = 'SwiftyForm/Class/HederFooterFormers/**/*' 
    end
end
