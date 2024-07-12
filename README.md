# LaunchDarkly Sample OpenFeature Ruby Server Application

[![Build and run](https://github.com/launchdarkly/hello-openfeature-ruby-server/actions/workflows/ci.yml/badge.svg)](https://github.com/launchdarkly/hello-openfeature-ruby-server/actions/workflows/ci.yml)

We've built a simple console script that demonstrates how LaunchDarkly's OpenFeature provider works.

## Build instructions

1. Set the environment variable `LAUNCHDARKLY_SDK_KEY` to your LaunchDarkly SDK key. If there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, set `LAUNCHDARKLY_FLAG_KEY` to the flag key; otherwise, a boolean flag of `sample-feature` will be assumed.
    ```bash
    export LAUNCHDARKLY_SDK_KEY="1234567890abcdef"
    export LAUNCHDARKLY_FLAG_KEY="my-boolean-flag"
    ```
1. If you have not installed the `bundler` tool, run `gem install bundler` on the command line.
1. On the command line, run `bundle install`
1. Run `bundle exec ruby main.rb`

You should see the message `"The <flag key> feature flag evaluates to <true/false>"`.
