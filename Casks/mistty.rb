cask "mistty" do
  version "0.12.0"
  sha256 "366646d40199d89584eb0ad81374a10fb3af7aa346bcb1ecee1beb18d0f1f14c"

  url "https://github.com/milch/mistty/releases/download/v#{version}/Mistty-v#{version}-arm64.zip"
  name "Mistty"
  desc "Native macOS terminal built on Ghostty"
  homepage "https://github.com/milch/mistty"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Mistty.app"
  binary "#{appdir}/Mistty.app/Contents/MacOS/mistty-cli", target: "mistty-cli"

  postflight do
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{appdir}/Mistty.app"
  end

  zap trash: [
    "~/Library/Application Support/com.mistty.app",
    "~/Library/Preferences/com.mistty.app.plist",
    "~/Library/Caches/com.mistty.app",
    "~/Library/Saved Application State/com.mistty.app.savedState",
  ]
end
