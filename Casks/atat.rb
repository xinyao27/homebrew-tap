cask "atat" do
  version "2.4.1"
  sha256 "5c0f59a2c369b5e7db7146ba0ecbc83b0f4ab89c300d43546a1e3d719426c3c0"

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

  # Runs before the app is removed. Calls AtAt's own TabTab IME clean-up
  # (graceful quit + remove only AtAt's input-source records + delete the
  # bundle/link). Do not kill the IME or trash HIToolbox/inputsources files.
  # On upgrade this also runs; launch heal re-enables TabTab when still on.
  uninstall quit:   "com.atat.app",
            script: {
              executable:   "#{appdir}/AtAt.app/Contents/MacOS/AtAt",
              args:         ["--tabtab-ime", "disable"],
              must_succeed: false,
            }

  zap trash: [
    "~/Library/Application Support/AtAt",
    "~/Library/Input Methods/AtAt.noindex",
    "~/Library/Input Methods/AtAtTab.app",
    "~/Library/Preferences/com.atat.app.plist",
  ]
end
