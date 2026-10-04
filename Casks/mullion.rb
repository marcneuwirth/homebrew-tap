cask "mullion" do
  version "0.2.0"
  sha256 "6ff806813de346e5048acfb970b064f66f9dc5f286701c7f9b31c4cc2567d65c"

  url "https://github.com/marcneuwirth/mullion/releases/download/v#{version}/Mullion-#{version}.zip"
  name "Mullion"
  desc "Keyboard-only grid window manager"
  homepage "https://github.com/marcneuwirth/mullion"

  depends_on macos: :ventura

  app "Mullion.app"

  uninstall early_script: {
              executable:   "#{appdir}/Mullion.app/Contents/MacOS/Mullion",
              args:         ["--unregister"],
              must_succeed: false,
            },
            quit:         "com.marcneuwirth.mullion"

  zap trash: [
    "~/.config/mullion",
    "~/Library/Logs/Mullion.log",
    "~/Library/Preferences/com.marcneuwirth.mullion.plist",
  ]
end
