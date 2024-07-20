class XcodeVersionManager < Formula
  desc "Manage multiple installed versions of Xcode"
  homepage "https://github.com/CraigSiemens/xcode-version-manager"
  url "https://github.com/CraigSiemens/xcode-version-manager.git",
      tag:      "1.0.2",
      revision: "1ee17e6f02586050a7157de0896ef9a4c2d36d09"
  license "MIT"
  head "https://github.com/CraigSiemens/xcode-version-manager.git", branch: "main"

  bottle do
    root_url "https://github.com/CraigSiemens/homebrew-tap/releases/download/xcode-version-manager-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "18c70ad508bc5e821e4b20f69b9c67b4ac8cd1a3ee75d6f5bcff632cd5d8522b"
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
