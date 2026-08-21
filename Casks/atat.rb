cask "atat" do
  version "0.5.0"
  sha256 "d6487294bf72087338a7f7266e20e7e967c4ee10a33e418fff0f137bdba68f2d"

  url "https://updates.atatapp.com/releases/#{version}/Atat-#{version}.dmg"
  name "Atat"
  desc "Command palette for using terminal AI agents from any app"
  homepage "https://atatapp.com/"

  livecheck do
    url "https://updates.atatapp.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Atat.app"

  uninstall quit: "com.atat.app"

  zap trash: [
    "~/Library/Application Support/Atat",
    "~/Library/Preferences/com.atat.app.plist",
  ]
end
