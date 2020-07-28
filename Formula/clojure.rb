class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/clojure-tools-1.10.1.561.tar.gz"
  sha256 "46c193d09f8fce9c0e5e530c2463586cec9717593cdee2f57199d278ed104e2d"

  devel do
    url "https://download.clojure.org/install/clojure-tools-1.10.1.604.tar.gz"
    sha256 "b8dbed73ea5686f8b4bb649baac79568f4ab2784bd8ccc292861957f8926ba1f"
    version "1.10.1.604"
  end

  bottle :unneeded

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -e \"(+ 1 1)\"").strip
    end
  end
end
