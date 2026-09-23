cask "pdfinfo" do
  version "1.1.1"
  sha256 "04de2218e624e42f370f86eeee4ebd84fba8014fb5b5cd59a29122f6dbf9ac0c"

  url "https://github.com/philipbel/PDFInfo/releases/download/v#{version}/PDFInfo-#{version}.dmg"
  name "PDF Info"
  desc "Native macOS app for inspecting PDF fonts and metadata"
  homepage "https://philipbel.github.io/PDFInfo"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "PDF Info.app"

  postflight_steps do
    run "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "{{appdir}}/PDF Info.app"]
  end

  uninstall quit: [
    "com.github.philipbel.PDFInfo"
  ]

  zap trash: [
    "~/Library/Preferences/com.github.philipbel.PDFInfo.plist"
  ]
end
