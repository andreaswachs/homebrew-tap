class Helix < Formula
  desc "Post-modern modal text editor with file tree viewer"
  homepage "https://github.com/andreaswachs/helix"
  license "MPL-2.0"
  version "25.7.5-filetree"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreaswachs/helix/releases/download/25.7.5-filetree/helix-25.7.5-filetree-aarch64-macos.tar.xz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/andreaswachs/helix/releases/download/25.7.5-filetree/helix-25.7.5-filetree-x86_64-macos.tar.xz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    url "https://github.com/andreaswachs/helix/releases/download/25.7.5-filetree/helix-25.7.5-filetree-x86_64-linux.tar.xz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    bin.install "hx"
    libexec.install "runtime"
    (etc/"helix").mkpath
  end

  def caveats
    <<~EOS
      To use helix, set the runtime path in your shell config:
        export HELIX_RUNTIME="#{opt_libexec}/runtime"

      Or add to ~/.config/helix/config.toml:
        # Configuration options at https://docs.helix-editor.com/configuration.html
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hx --version")
  end
end
