cask "pesto" do
  version "1.1.0"
  sha256 "f04a442fd71da0fbd4df46389fd68375f0f0f6e4689e9b248d5b9affff317b7f"

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
