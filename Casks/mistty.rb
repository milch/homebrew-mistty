cask "mistty" do
  version "0.13.0"
  sha256 "a85c3cf3c2c008113ff2fbc49f7e8c53c8f06e28eab2f79e70647c4908d7f5a5"

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
