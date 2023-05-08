# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic

DESCRIPTION="Interactive whiteboard for schools and universities"
HOMEPAGE="https://openboard.ch/index.en.html"
SRC_URI="https://github.com/OpenBoard-org/OpenBoard/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 amd64"

IUSE="test qt5 qt6 X"
RESTRICT="!test? ( test )"
REQUIRED_USE="^^ ( qt5 qt6 ) X"

RDEPEND="media-libs/fontconfig"

DEPEND="${RDEPEND}
  app-text/poppler[cxx,qt5?]
  dev-libs/openssl
  dev-libs/quazip[qt5?]
  media-libs/mesa[gles1] 
  media-video/ffmpeg[font-config,libsdl,opengl,openssl]
  x11-libs/libxcb"

BDEPEND=""

S="${WORKDIR}/OpenBoard-${PV}"

src_configure() {
  econf $(use_enable X)
}