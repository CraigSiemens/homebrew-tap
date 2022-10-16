class XcodeVersionManager < Formula
  desc "Manage multiple installed versions of Xcode"
  homepage "https://github.com/CraigSiemens/xcode-version-manager"
  url "https://github.com/CraigSiemens/xcode-version-manager.git", 
    tag: "0.2.0",
    revision: "9f90f67cdc0a8800682dd41ea9e09f0248f1dbeb"
  license "MIT"
  head "https://github.com/CraigSiemens/xcode-version-manager.git", branch: "main"

  depends_on xcode: ["13.3", :build]
  uses_from_macos "swift"

  def install
    system "make", "build", "completions"
    bin.install ".build/release/xcvm"

    bash_completion.install ".build/completions/bash" => "xcvm"
    zsh_completion.install ".build/completions/zsh" => "_xcvm"
    fish_completion.install ".build/completions/fish" => "xcvm.fish"
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
