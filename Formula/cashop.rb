class Cashop < Formula
  desc "Official command-line interface for the Cashop platform"
  homepage "https://github.com/Cashop-Tech/cashop-cli"
  url "https://github.com/Cashop-Tech/cashop-cli/releases/download/v0.1.0/cashop-cli-0.1.0.tar.gz"
  sha256 "ac1ce180f14272293abecae8e54dd72ac7f2ad2581584b716710d3621c6f2f67"
  license "UNLICENSED"
  version "0.1.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: false)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cashop --version")
  end
end
