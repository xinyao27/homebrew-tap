cask "atat" do
  version "2.2.0"
  sha256 "28983c073ccfea13bf792a8b8d5af35d31cbb8148b8e45f84de3fd0a27d25422"

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
