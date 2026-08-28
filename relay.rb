# Homebrew formula for Relay.
#
# This repo IS the Homebrew tap for Relay: `brew tap Fiqqar/relay` resolves to
# github.com/Fiqqar/homebrew-relay and this formula is its canonical copy.
# The main Fiqqar/Relay repo no longer ships a formula (see its RELEASE.md).
#
# On every release, re-point `url` + `sha256` below to the new sdist asset
# (built by the Release workflow on the `v*` tag) and push.
#
# Released by `sdist` from the GitHub Release, built into a virtualenv.
class Relay < Formula
  include Language::Python::Virtualenv

  desc "Your Git workflow, on autopilot: AI Conventional Commits with a manual fallback."
  homepage "https://github.com/Fiqqar/Relay"
  url "https://github.com/Fiqqar/Relay/releases/download/v0.7.3/relay_cli-0.7.3.tar.gz"
  sha256 "adef0366ad1127ad9c83cf003c9e33add87a88a7bd0e70e1e6bfdbeae7e0d4cb"
  license "MIT"
  head "https://github.com/Fiqqar/Relay.git", branch: "main"

  depends_on "python3"

  def install
    # Zero runtime dependencies, so a plain pip install into the formula's
    # virtualenv is enough — no post-install steps.
    virtualenv_install_with_resources
  end

  test do
    assert_match "relay #{version}", shell_output("#{bin}/relay --version")
  end
end
