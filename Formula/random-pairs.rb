class RandomPairs < Formula
  desc "Generate and track random pairs of items"
  homepage "https://github.com/CraigSiemens/random-pairs"
  url "https://github.com/CraigSiemens/random-pairs.git",
      tag:      "1.0.5",
      revision: "3427686b23f12e4dcf8e2883960f21684ad505a6"
  license "MIT"
  head "https://github.com/CraigSiemens/random-pairs.git", branch: "main"

  bottle do
    root_url "https://github.com/CraigSiemens/homebrew-tap/releases/download/random-pairs-1.0.5"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c1c7485003bbba16ff7ed2e2cf8dc7e44b0c7f0116835ab58bb65bb43ec261c3"
  end

  depends_on xcode: ["14.2", :build]
  uses_from_macos "swift"

  def install
    system "make", "random-pairs"
    bin.install ".build/release/random-pairs"
    generate_completions_from_executable(bin/"random-pairs", "--generate-completion-script")
  end

  test do
    system "#{bin}/random-pairs", "-h"
  end
end
