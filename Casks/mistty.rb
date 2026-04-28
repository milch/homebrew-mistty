cask "mistty" do
  version "0.9.0"
  sha256 "65b60867d854f51c6cfb84deef99f542435b05f97be58652be9e24dfb8bfbd54"

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
