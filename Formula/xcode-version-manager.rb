class XcodeVersionManager < Formula
  desc "Manage multiple installed versions of Xcode"
  homepage "https://github.com/CraigSiemens/xcode-version-manager"
  url "https://github.com/CraigSiemens/xcode-version-manager.git",
      tag:      "1.1.0",
      revision: "d97025451b7e94a1ad91513ab4c93775fc9a4891"
  license "MIT"
  head "https://github.com/CraigSiemens/xcode-version-manager.git", branch: "main"

  bottle do
    root_url "https://github.com/CraigSiemens/homebrew-tap/releases/download/xcode-version-manager-1.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "74471403318fd9c669006c77dca4195a4c46d5acfc9ff22dc55738606b99539e"
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
