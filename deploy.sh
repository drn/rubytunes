#!/bin/bash
rm rubytunes-*.gem 2>/dev/null
gem build rubytunes.gemspec
gem push rubytunes-*.gem
