require 'ldclient-rb'
require 'ldclient-openfeature'
require 'open_feature/sdk'

sdk_key = ENV['LAUNCHDARKLY_SDK_KEY']
feature_flag_key = ENV['LAUNCHDARKLY_FLAG_KEY']

if sdk_key == ''
  puts "*** Please set the LAUNCHDARKLY_SDK_KEY environment variable\n"
  exit 1
elsif feature_flag_key == ''
  puts "*** Please set the LAUNCHDARKLY_FLAG_KEY environment variable\n"
  exit 1
end

provider = LaunchDarkly::OpenFeature::Provider.new(sdk_key)

OpenFeature::SDK.configure do |config|
  config.set_provider(provider)

  # Set up the context properties. This context should appear on your LaunchDarkly contexts dashboard
  # soon after you run the demo.
  config.evaluation_context = OpenFeature::SDK::EvaluationContext.new(
    key: 'example-user-key',
    kind: 'user',
    name: 'Sandy'
  )
end

client = OpenFeature::SDK.build_client

flag_value = client.fetch_boolean_value(flag_key: feature_flag_key, default_value: false)
puts "*** The #{feature_flag_key} feature flag evaluates to #{flag_value}."
