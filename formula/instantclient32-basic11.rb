require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic package.
class Instantclient32Basic11 < Formula
  desc "Oracle Instant Client Basic x32"
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"
  hp = homepage

  url "http://download.oracle.com/otn/mac/instantclient/11204/instantclient-basic-macos.x32-11.2.0.4.0.zip",
      :using => (Class.new(CacheWoDownloadStrategy) do
                   define_method :homepage do
                     hp
                   end
                 end)
  sha256 "c1d59a284d7ed8a65fc38c1df08b4ab632aebeb27420f7892e38e0725f1325b4"

  conflicts_with "instantclient-basiclite",
                 :because => "Differing versions of same formula"

  def install
    %w[libclntsh.dylib libocci.dylib].each do |dylib|
      ln_s "#{dylib}.11.1", dylib
    end
    lib.install Dir["*.dylib*"]
  end
end
