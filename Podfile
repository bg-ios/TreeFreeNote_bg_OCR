# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'

target 'TreeFreeNote' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

	#pod 'QBImagePickerController', '~> 3.4'
  pod 'GoogleSignIn'
  pod 'GoogleAPIClientForREST/Drive'
  # Pods for TreeFreeNote

  target 'TreeFreeNoteTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TreeFreeNoteUITests' do
    # Pods for testing
  end

end

post_install do |installer|

  installer.pods_project.build_configurations.each do |config|

    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"

  end

end
