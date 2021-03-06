class TerminalNotifier < Formula
  desc "Send macOS User Notifications from the command-line"
  homepage "https://github.com/julienXX/terminal-notifier"
  url "https://github.com/julienXX/terminal-notifier/archive/1.8.0.tar.gz"
  sha256 "390ae441156c1c621c56ccb3cffa670ba74ee60762bbcf12c92686b749bf232e"
  head "https://github.com/julienXX/terminal-notifier.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "390ae441156c1c621c56ccb3cffa670ba74ee60762bbcf12c92686b749bf232e" => :mojave
    sha256 "f112656234f4100d23cc1a41b96f92a09974360a822c2ec0fb6f9970862c1a22" => :high_sierra
    sha256 "210cd525fad70bbaef40f092bc3478b1519f68f73c034990230d8b1cc61a8a7c" => :sierra
    sha256 "75ce68fd95fb502e20ccb25be72f7db12112ac1a4bdf5a70c140cd174ecbacf5" => :el_capitan
  end

  depends_on :xcode => :build
  depends_on :macos => :mountain_lion

  def install
    xcodebuild "-project", "Terminal Notifier.xcodeproj",
               "-target", "terminal-notifier",
               "SYMROOT=build",
               "-verbose",
               "CODE_SIGN_IDENTITY="
    bin.install "build/Release/terminal-notifier"
  end

  test do
    assert_match version.to_s, pipe_output("#{bin}/terminal-notifier -help")
  end
end
