class Cashop < Formula
  desc "Official command-line interface for the Cashop platform"
  homepage "https://github.com/Cashop-Tech/cashop-cli"
  url "https://github.com/Cashop-Tech/cashop-cli/releases/download/v0.1.2/cashop-cli-0.1.2.tar.gz"
  sha256 "240949963caf0a2bbe737b706837bd1d43d29d8206086a9bc22bb3e57288c054"
  license "UNLICENSED"
  version "0.1.2"

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
