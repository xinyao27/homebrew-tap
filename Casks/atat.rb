cask "atat" do
  version "1.0.1"
  sha256 "57e1999ab1718dc836633bb8a87647a17846f168beb9a62f4d05e5f6f9f64128"

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
