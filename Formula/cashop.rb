class Cashop < Formula
  desc "Official command-line interface for the Cashop platform"
  homepage "https://github.com/Cashop-Tech/cashop-cli"
  url "https://github.com/Cashop-Tech/cashop-cli/releases/download/v0.1.4/cashop-cli-0.1.4.tar.gz"
  sha256 "6248e9924b95b232cf0f89efd9b7750156c2a25820e0bb400a59b5e89ef05897"
  license "UNLICENSED"
  version "0.1.4"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system "npm", "install", "--omit=dev", "--no-audit", "--no-fund", "--loglevel=error"
    end
    (bin/"cashop").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/entry.js" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cashop --version")
  end
end
