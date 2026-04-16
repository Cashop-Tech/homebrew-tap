class Cashop < Formula
  desc "Official command-line interface for the Cashop platform"
  homepage "https://github.com/Cashop-Tech/cashop-cli"
  url "https://github.com/Cashop-Tech/cashop-cli/releases/download/v0.1.1/cashop-cli-0.1.1.tar.gz"
  sha256 "1253f9925d8e1dbd9c8ab1376010ee2519ed82825e2f33d6d21b440510b3e4ca"
  license "UNLICENSED"
  version "0.1.1"

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
