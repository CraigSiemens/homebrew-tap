class XcodeVersionManager < Formula
  desc "Manage multiple installed versions of Xcode"
  homepage "https://github.com/CraigSiemens/xcode-version-manager"
  url "https://github.com/CraigSiemens/xcode-version-manager.git",
      tag:      "1.5.4",
      revision: "fbc961bbaa229316d186c0ab975a8976b18d02e6"
  license "MIT"
  head "https://github.com/CraigSiemens/xcode-version-manager.git", branch: "main"

  bottle do
    root_url "https://github.com/CraigSiemens/homebrew-tap/releases/download/xcode-version-manager-1.5.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2496d7c566c290c84249e8b381d6d8f095b56b182a23ca1cdad821627833588e"
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
