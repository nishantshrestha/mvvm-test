# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
end

target 'MVVM' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MVVM
  rx_swift
  
  # Networking
  pod 'Alamofire', '~> 4.5'
  pod 'RxAlamofire'
  pod 'AlamofireObjectMapper', '~> 5.0'
  
  # Utilities
  pod 'SwiftyJSON'
  pod 'Kingfisher'
  
  # UI
  pod 'SVProgressHUD'
  
  target 'MVVMTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
