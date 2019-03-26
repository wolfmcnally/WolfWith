Pod::Spec.new do |s|
    s.name             = 'WolfWith'
    s.version          = '2.0.1'
    s.summary          = 'A Swift implementation of the With-Operator.'

    # s.description      = <<-DESC
    # TODO: Add long description of the pod here.
    # DESC

    s.homepage         = 'https://github.com/wolfmcnally/WolfWith'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
    s.source           = { :git => 'https://github.com/wolfmcnally/WolfWith.git', :tag => s.version.to_s }

    s.source_files = 'Sources/WolfWith/**/*'

    s.swift_version = '5.0'

    s.ios.deployment_target = '9.3'
    s.macos.deployment_target = '10.13'
    s.tvos.deployment_target = '11.0'

    s.module_name = 'WolfWith'
end
