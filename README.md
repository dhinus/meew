# Meew ![Build Status](https://travis-ci.org/dhinus/meew.svg)

A simple example of using Ruby for command line utilities.

## Install

This is only an example and is _not_ currently published on RubyGems.

To install you can:

```sh
git clone https://github.com/dhinus/meew.git
cd meew
gem build meew.gemspec
gem install ./meew-0.0.1.gem
```

## Usage

```sh
meew [command]
```

Available commands:

* **browser** open a new browser window displaying an image of a cat
* **file** save on the desktop an image of a cat
* **fact** display a cat fact
* **news** CAN I HAS NEWZ?

## Running tests

```sh
bundle
bundle exec rake
```
