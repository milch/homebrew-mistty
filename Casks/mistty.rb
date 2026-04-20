cask "mistty" do
  version "0.5.3"
  sha256 "8ebb9b3e0e12b0e8330d5a63355aa2c20e2108bc40d7b31de7f791f06eac805e"

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
  binary "#{appdir}/Mistty.app/Contents/MacOS/mistty-cli", target: "mistty"

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
