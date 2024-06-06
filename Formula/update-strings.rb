class UpdateStrings < Formula
  desc "Commands for working with string files"
  homepage "https://github.com/CraigSiemens/update-strings"
  url "https://github.com/CraigSiemens/update-strings.git",
      tag:      "1.2.1",
      revision: "84f2832ba9a20e5ec9ab47d77d3945f95d38b72d"
  license "MIT"
  head "https://github.com/CraigSiemens/update-strings.git", branch: "main"

  bottle do
    root_url "https://github.com/CraigSiemens/homebrew-tap/releases/download/update-strings-1.2.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "be4933d5c7ede0b921c925583e4388690888916531283e88bb342496b49c8143"
  end

  depends_on xcode: ["12.5", :build]
  uses_from_macos "swift"

  def install
    system "make", "build"
    bin.install ".build/release/update-strings"
    generate_completions_from_executable(bin/"update-strings", "--generate-completion-script")
  end

  test do
    system "#{bin}/update-strings", "-h"
  end
end
