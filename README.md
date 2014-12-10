# RubyTunes
[![Gem Version](https://badge.fury.io/rb/rubytunes.svg)](http://badge.fury.io/rb/rubytunes)
[![Code Climate](https://codeclimate.com/github/drn/rubytunes/badges/gpa.svg)](https://codeclimate.com/github/drn/rubytunes)

**RubyTunes** provides a simple ruby interface to iTunes in OS X.

## Motivation

Programmatically controlling iTunes via Apple Scripts is a headache. RubyTunes
provides an elegant API designed to descriptively manipulate iTunes with minimal
code.

## Installation

Add this line to your application's Gemfile:

    gem 'rubytunes'

Or install the CLI:

    $ gem install rubytunes

## Contents

* [1. Usage](#1-usage)
* [2. Interface](#2-interface)
  * [2.1 Playback](#21-playback)
  * [2.2 Track](#22-track)

## 1. Usage

**RubyTunes** requires instantiation

```ruby
rubytunes = RubyTunes.new
```

## 2. Interface

### 2.1 Playback

Can be either instantiated as a standalone class:
```ruby
playback = RubyTunes::Playback.new
```
or through the a base **RubyTunes** instance:
```ruby
playback = RubyTunes.new.playback
```

Basic controls:
```ruby
playback.play
playback.pause
playback.stop
playback.next
playback.previous
```

Toggle playback (pause / play)
```ruby
playback.toggle
```

State:
```ruby
playback.state # => 'playing', 'paused', or 'stopped'
```

Position:
```ruby
playback.position # => 100.00
playback.position = 100.0
```


### 2.2 Track

Initialization defaults to the current track:
```ruby
track = RubyTunes::Track.new
```
A track can be initialized by id, name, or direct reference:
```ruby
track = RubyTunes::Track.new(id: '63E93B27B3F0E5A7')
track = RubyTunes::Track.new(name: 'LIC Adventure Club Mix')
track = RubyTunes::Track.new(reference: 'some track')
```

Properties:
```ruby
track.id # => '63E93B27B3F0E5A7'
track.name # => 'LIC Adventure Club Mix'
```

### 2.3 Search

*Coming Soon*

### 2.4 Manipulation

*Coming Soon*

### Depedencies

This API is dependent on `osascript`.
