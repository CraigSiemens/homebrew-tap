class UpdateStrings < Formula
  desc "Commands for working with string files"
  homepage "https://github.com/CraigSiemens/update-strings"
  url "https://github.com/CraigSiemens/update-strings.git",
      tag:      "1.2.1",
      revision: "84f2832ba9a20e5ec9ab47d77d3945f95d38b72d"
  license "MIT"
  head "https://github.com/CraigSiemens/update-strings.git", branch: "main"

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
