cask "worksync" do
  version "0.2.1"
  sha256 "0b50e80308cb8d0072bda6afa99ef99a827fb77041d7ee4db135405a68f39ad0"

  url "https://github.com/gAmUssA/worksync/releases/download/v#{version}/WorkSync-v#{version}-arm64.tar.gz",
      verified: "github.com/gAmUssA/worksync/"
  name "WorkSync"
  desc "Menu bar app and CLI that mirrors busy time onto a work calendar"
  homepage "https://github.com/gAmUssA/worksync"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch:  :arm64
  depends_on macos: :sonoma

  app "WorkSync.app"
  # The CLI is the same binary inside the bundle, so this exposes `worksync`
  # on PATH without shipping a second copy.
  binary "#{appdir}/WorkSync.app/Contents/MacOS/worksync"

  uninstall launchctl: "io.gamov.worksync",
            quit:      "io.gamov.worksync"

  # config.toml is the only thing here a user might have hand-written, and
  # `zap` is opt-in (`brew uninstall --zap`), so removing it is appropriate.
  zap trash: [
    "~/.config/worksync",
    "~/Library/LaunchAgents/io.gamov.worksync.plist",
    "~/Library/Logs/worksync",
  ]
end
