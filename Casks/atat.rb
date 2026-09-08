cask "atat" do
  version "1.0.0"
  sha256 "6e56b96c2305a380a1c6e76280761ab4b1adfe8a25b85482cf811bdb98851616"

  url "https://updates.atatapp.com/releases/#{version}/AtAt-#{version}.dmg"
  name "AtAt"
  desc "Command palette for using terminal AI agents from any app"
  homepage "https://atatapp.com/"

  livecheck do
    url "https://updates.atatapp.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "AtAt.app"

  uninstall quit: "com.atat.app"

  zap trash: [
    "~/Library/Application Support/AtAt",
    "~/Library/Preferences/com.atat.app.plist",
  ]
end
