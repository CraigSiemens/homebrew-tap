class XcodeVersionManager < Formula
  desc "Manage multiple installed versions of Xcode"
  homepage "https://github.com/CraigSiemens/xcode-version-manager"
  url "https://github.com/CraigSiemens/xcode-version-manager.git", 
    tag: "0.7.0",
    revision: "4dac402225c697f197f4a8dcc5e5f4e254faa300"
  license "MIT"
  head "https://github.com/CraigSiemens/xcode-version-manager.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  uses_from_macos "swift"

  def install
    system "make", "build"
    bin.install ".build/release/xcvm"
    generate_completions_from_executable(bin/"xcvm", "--generate-completion-script")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test xcode-version-manager`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
