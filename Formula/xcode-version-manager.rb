class XcodeVersionManager < Formula
  desc "Manage multiple installed versions of Xcode"
  homepage "https://github.com/CraigSiemens/xcode-version-manager"
  url "https://github.com/CraigSiemens/xcode-version-manager.git",
      tag:      "1.3.0",
      revision: "f84f13621f9679a1e2734c9a5c92a3de55225adb"
  license "MIT"
  head "https://github.com/CraigSiemens/xcode-version-manager.git", branch: "main"

  bottle do
    root_url "https://github.com/CraigSiemens/homebrew-tap/releases/download/xcode-version-manager-1.2.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "270a7be1e61557f1cb3cd98994f52f9851ec783809f685fa48e9ca07e46b63ac"
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
