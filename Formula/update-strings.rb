class UpdateStrings < Formula
  desc "Commands for working with string files"
  homepage "https://github.com/CraigSiemens/update-strings"
  url "https://github.com/CraigSiemens/update-strings.git",
    tag: "1.2.0",
    revision: "7b066856a9c90da13c6d6e8465bcaa03466dfe54"
  license "MIT"
  head "https://github.com/CraigSiemens/update-strings.git", branch: "main"

  depends_on xcode: ["12.5", :build]
  uses_from_macos "swift"

  def install
    system "make", "build", "completions"
    bin.install ".build/release/update-strings"

    bash_completion.install ".build/completions/bash" => "update-strings"
    zsh_completion.install ".build/completions/zsh" => "_update-strings"
    fish_completion.install ".build/completions/fish" => "update-strings.fish"
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
