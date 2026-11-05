cask "pesto" do
  version "1.3.0"
  sha256 "2c65a52e15ee33197025d852895cd06f82500d3eb3850382cb3691cdbec4d7f2"

  url "https://github.com/MichaelRo/copypesto/releases/download/v#{version}/Pesto-#{version}.dmg"
  name "Pesto"
  desc "Local, encrypted clipboard manager"
  homepage "https://copypesto.net/"

  livecheck do
    url "https://copypesto.net/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Pesto.app"

  uninstall quit: "net.copypesto.pesto"

  zap trash: [
    "~/Library/Application Support/net.copypesto.pesto",
    "~/Library/Caches/net.copypesto.pesto",
    "~/Library/HTTPStorages/net.copypesto.pesto",
    "~/Library/Preferences/net.copypesto.pesto.plist",
    "~/Library/Saved Application State/net.copypesto.pesto.savedState",
  ]
end
