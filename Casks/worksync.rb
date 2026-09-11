cask "worksync" do
  version "0.3.0"
  sha256 "d4b1b0a2e65a566b64e87f739991679b24ca2f3eaaef9224f4736d165ce28e84"

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
