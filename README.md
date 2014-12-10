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
  * [2.2 Item](#22-item)

## 1. Usage

**RubyTunes** requires instantiation

```ruby
rubytunes = RubyTunes.new
```

## 2. Interface

### 2.1 Playback

Can be either instantiated as a standalone class:
```ruby
RubyTunes::Playback.new
```
or through the a base **RubyTunes** instance:
```ruby
RubyTunes.new.playback
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


### 2.2 Item

RubyTunes defines multiple iTunes items that can be manipulated through a
consistent interface.

Defined items:
```ruby
RubyTunes::Track.new
RubyTunes::Playlist.new
```

**Note:** For the purposes of this example, `RubyTunes::Item` will be used.
However, direct instantiation of this class will result in an exception. Only
subclasses of `RubyTunes::Item` may be instantiatied.

Initialization defaults to the current item:
```ruby
RubyTunes::Item.new
```
An item can be initialized by id, name, or direct reference:
```ruby
RubyTunes::Item.new(id: '63E93B27B3F0E5A7')
RubyTunes::Item.new(name: 'Item Name')
RubyTunes::Item.new(reference: 'some item')
```

Properties:
```ruby
item.id   # => '63E93B27B3F0E5A7'
item.name # => 'Item Name'
```

### 2.3 Search

*Coming Soon*

### 2.4 Manipulation

*Coming Soon*

### Depedencies

This API is dependent on `osascript`.
