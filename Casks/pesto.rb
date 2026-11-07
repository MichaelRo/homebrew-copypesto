cask "pesto" do
  version "1.5.0"
  sha256 "d81ea74f154b0d749d1bd1c4e49cc88c163ded8137b45e402fd487f556b8c9aa"

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
