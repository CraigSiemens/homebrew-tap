class UpdateStrings < Formula
  desc "Commands for working with string files for iOS, macOS, tvOS, and watchOS development."
  homepage "https://github.com/CraigSiemens/update-strings"
  url "https://github.com/CraigSiemens/update-strings.git", tag: "1.0.0"
  license "MIT"
  head "https://github.com/CraigSiemens/update-strings.git", branch: "main"

  depends_on xcode: ["12.5", :build]
  depends_on macos: :catalina

  def install
    system "make", "build", "completions"
    bin.install ".build/release/update-strings"

    bash_completion.install ".build/completions/bash" => "carthage"
    zsh_completion.install ".build/completions/zsh" => "_carthage"
    fish_completion.install ".build/completions/fish" => "carthage.fish"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test update-strings`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
