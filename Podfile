# Uncomment this line to define a global platform for your project
 platform :ios, '8.0'
# Uncomment this line if you're using Swift
 use_frameworks!

target 'RealmMBPlatform' do
    pod 'SwiftGifOrigin', '~> 1.6.1'
    pod ‘RealmSwift’
    pod 'IQKeyboardManagerSwift'
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
    pod 'SCLAlertView'
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
		end
	end
end
