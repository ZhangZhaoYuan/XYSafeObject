 Pod::Spec.new do |s|

    s.name         = 'XYSafeObject'
    s.version      = '1.0'
    s.summary      = 'iOS防crash处理'
    s.homepage     = 'https://github.com/ZhangZhaoYuan/XYSafeObject'
    s.license      = 'MIT'
    s.authors      = { "ZhangZhaoYuan" => "385893826" }
    s.platform     = :ios, '9.0'
    s.source       = {:git => 'https://github.com/ZhangZhaoYuan/XYSafeObject.git', :tag => s.version}
    s.source_files = 'XYSafeObject/SafeObject/Object/*.{h,m}'
    s.requires_arc = true
    end
