
Pod::Spec.new do |s|
  s.name         = "PureViewIcon"
  s.version      = "0.0.2"
  s.summary      = "Pure UIView icon"
  s.homepage     = "https://github.com/akuraru/PureViewIcon"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "akuraru" => "akuraru@gmail.com" }
  s.source       = {
    :git => "https://github.com/akuraru/PureViewIcon.git",
    :tag => s.version.to_s
  }
  s.platform     = :ios, '10.0'

  s.default_subspec = 'All'

  s.subspec 'All' do |ss|
    ss.dependency 'PureViewIcon/Core'
  end
  s.subspec 'Core' do |ss|
    ss.source_files = 'PureViewIcon/**/*.{swift}'
    ss.dependency 'SnapKit'
  end
end
