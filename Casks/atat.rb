cask "atat" do
  version "0.9.0"
  sha256 "ab2ba53c466dd93086810feeeb2b03427eed49f7a5e546c3f746adcbacaf05c8"

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
