# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit flag-o-matic qmake-utils

DESCRIPTION="Interactive whiteboard for schools and universities"
HOMEPAGE="https://openboard.ch/index.en.html"
SRC_URI="https://github.com/OpenBoard-org/OpenBoard/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 amd64"

IUSE="fdk libaom opus pulseaudio test theora qmake qt5 -qt6 vorbis vpx x264 wayland X"
RESTRICT="!test? ( test )"
REQUIRED_USE="^^ ( qt5 qt6 ) qmake wayland X"

RDEPEND="media-libs/fontconfig"

DEPEND="${RDEPEND}
  app-text/poppler[cxx,qt5]
  dev-libs/openssl
  dev-libs/quazip[qt5]
  dev-qt/qtmultimedia
  dev-qt/qtpositioning
  dev-qt/qtwebchannel
  dev-qt/qtwebengine[jumbo-build]
  media-libs/libsdl
  media-libs/mesa[gles1] 
  media-video/ffmpeg[alsa,encode,fdk?,font-config,libaom?,mp3,opengl,openssl,opus?,oss,pulseaudio?,sdl,theora?,vorbis?,vpx?,x264?]
  x11-libs/libxcb
  pulseaudio? ( media-sound/pulseaudio )
  wayland? ( dev-qt/qtwayland )"

BDEPEND="dev-qt/qtcore
  dev-qt/qtchooser
"

S="${WORKDIR}/OpenBoard-${PV}"

src_configure() {
  econf $(use_enable X)
}