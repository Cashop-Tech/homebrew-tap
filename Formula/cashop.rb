class Cashop < Formula
  desc "Official command-line interface for the Cashop platform"
  homepage "https://github.com/Cashop-Tech/cashop-cli"
  url "https://github.com/Cashop-Tech/cashop-cli/releases/download/v0.0.0/cashop-cli-0.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "UNLICENSED"
  version "0.0.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: false)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cashop --version")
  end
end
