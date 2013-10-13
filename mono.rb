require 'formula'

class Mono < Formula
  homepage 'http://http://www.mono-project.com/'
  url 'http://download.mono-project.com/sources/mono/mono-3.2.3.tar.bz2'
  sha1 'e356280ae45beaac6476824d551b094cd12e03b9'
  head 'git://github.com/mono/mono.git'

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    args = ["--prefix=#{prefix}", "--with-glib=embedded", "--enable-nls=no"]
    args << "--host=x86_64-apple-darwin10" if MacOS.prefer_64_bit?

    system "./autogen.sh", *args
    system "make"
    system "make install"
  end

  test do
    system "mono"
  end
end
