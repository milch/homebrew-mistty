cask "mistty" do
  version "0.8.4"
  sha256 "eb2d92b2ec37feeb14da667e3c54163056f9b7117c58f49aab4123a7d48edc92"

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
