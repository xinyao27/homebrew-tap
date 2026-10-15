cask "atat" do
  version "2.0.1"
  sha256 "86bf20d6ecf8451368c81e432f0080cb1378d069af8e20236fd9734cb6d2613b"

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
