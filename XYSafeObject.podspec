 Pod::Spec.new do |s|

    s.name         = 'SafeObject'
    s.version      = '1.0'
    s.summary      = 'iOS防crash处理'
    s.homepage     = 'https://github.com/ZhangZhaoYuan/XYSafeObject'
    s.license      = 'MIT'
    s.authors      = { "ZhangZhaoYuan" => "385893826" }
    s.platform     = :ios, '9.0'
    s.source       = {:git => 'https://github.com/ZhangZhaoYuan/XYSafeObject.git', :tag => s.version}
    s.source_files = 'XYSafeObject/**/*'
    s.requires_arc = true
    s.description  = <<-DESC
                          XYSafeObject iOS防crash处理
                   DESC

    XYSafeObject is for easier to use
    DESC
    end
