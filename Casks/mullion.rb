cask "mullion" do
  version "0.2.0"
  sha256 "05eb9df4debcbab69364e667a58e13381897dffd1af71d7b338de5e05e185100"

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
