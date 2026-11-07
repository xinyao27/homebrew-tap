cask "atat" do
  version "2.3.3"
  sha256 "5f8615acd420ca7820d9f560d8f78db6790c68916356b4079e6620469947e01b"

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
