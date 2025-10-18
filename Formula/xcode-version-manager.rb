class XcodeVersionManager < Formula
  desc "Manage multiple installed versions of Xcode"
  homepage "https://github.com/CraigSiemens/xcode-version-manager"
  url "https://github.com/CraigSiemens/xcode-version-manager.git",
      tag:      "1.5.1",
      revision: "8336f774a15505b2fadafe3396b48461d367efc7"
  license "MIT"
  head "https://github.com/CraigSiemens/xcode-version-manager.git", branch: "main"

  bottle do
    root_url "https://github.com/CraigSiemens/homebrew-tap/releases/download/xcode-version-manager-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5c227902384357db52da6d871de197e0e8bb26f51ea9e6c538bd775312c5c2c2"
  end

  depends_on xcode: ["15.0", :build]
  uses_from_macos "swift"

  def install
    system "make", "build"
    bin.install ".build/release/xcvm"
    generate_completions_from_executable(bin/"xcvm", "--generate-completion-script")
  end

  test do
    system "#{bin}/xcvm", "-h"
  end
end
