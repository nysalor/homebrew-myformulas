require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cmigemo < Formula
  homepage 'http://www.kaoriya.net/software/cmigemo'
  url 'https://github.com/koron/cmigemo', :using => :git
  version '1.3e'
  head 'https://github.com/koron/cmigemo', :using => :git

  depends_on 'nkf' => :build

  def install
    ENV.append 'LDFLAGS', '-headerpad_max_install_names'

    system "./configure", "--prefix=#{prefix}"
    system "make osx-dict"
    ENV.j1 # Install can fail on multi-core machines unless serialized
    system "make osx-install"
  end
end
