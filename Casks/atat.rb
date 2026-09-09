cask "atat" do
  version "1.0.2"
  sha256 "51979f3accc4dfe4f2287250a951a8fe58b3f27a23d97f0793c153f98f492a89"

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
