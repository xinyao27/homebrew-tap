cask "atat" do
  version "1.2.0"
  sha256 "47e38dc24f87879a30727432cb8965a13d363e429f0fb1f08b5fa65a12664651"

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
  depends_on macos: :sequoia

  app "AtAt.app"

  uninstall quit: "com.atat.app"

  zap trash: [
    "~/Library/Application Support/AtAt",
    "~/Library/Preferences/com.atat.app.plist",
  ]
end
