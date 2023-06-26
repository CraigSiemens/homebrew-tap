class RandomPairs < Formula
  desc "A set of tools for generating and tracking random pairs of items."
  homepage "https://github.com/CraigSiemens/random-pairs"
  url "https://github.com/CraigSiemens/random-pairs.git", 
    tag: "1.0.3",
    revision: "11aab3b617953d7d4ce7ff30f9744446cb2c1098"
  license "MIT"
  head "https://github.com/CraigSiemens/random-pairs.git", branch: "main"

  depends_on xcode: ["14.2", :build]
  uses_from_macos "swift"

  def install
    system "make", "random-pairs", "completions"
    bin.install ".build/release/random-pairs"

    bash_completion.install ".build/completions/bash" => "random-pairs"
    zsh_completion.install ".build/completions/zsh" => "_random-pairs"
    fish_completion.install ".build/completions/fish" => "random-pairs.fish"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test random-pairs`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
