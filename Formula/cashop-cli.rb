# Placeholder formula — reserved for the upcoming Cashop-CLI release.
# This file will be updated by CI on every release of cashop-cli.
# Do not install this placeholder; it will fail on purpose.

class CashopCli < Formula
  desc "Cashop-CLI — official command-line interface for the Cashop platform"
  homepage "https://cli.cashop.com"
  version "0.0.0-placeholder"
  license "MIT"

  url "https://github.com/Cashop-Tech/cashop-cli/releases/download/v0.0.0-placeholder/placeholder.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  def install
    odie "cashop-cli has not been released yet. Track progress at https://github.com/Cashop-Tech/cashop-cli"
  end

  test do
    assert_match "cashop-cli", shell_output("#{bin}/cashop-cli --version")
  end
end
