class Cashop < Formula
  desc "Official command-line interface for the Cashop platform"
  homepage "https://github.com/Cashop-Tech/cashop-cli"
  url "https://github.com/Cashop-Tech/cashop-cli/releases/download/v0.1.3/cashop-cli-0.1.3.tar.gz"
  sha256 "1c31ff5b72c63ab5297862b970b5579d9c66fdf7044e238bdb22b418beae8213"
  license "UNLICENSED"
  version "0.1.3"

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
