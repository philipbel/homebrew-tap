cask "pdfinfo" do
  version "1.1.0"
  sha256 "a579b2f85740f2eaf2fe75e136fa8e6d03d4b0cfd693ab8250ffb28f731f88bc"

  url "https://github.com/philipbel/PDFInfo/releases/download/v#{version}/PDFInfo-#{version}.dmg"
  name "PDF Info"
  desc "Native macOS app for inspecting PDF fonts and metadata"
  homepage "https://github.com/philipbel/PDFInfo"

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
