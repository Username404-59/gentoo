# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="A curses-based editor for ASCII art"
HOMEPAGE="https://aewan.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/project/${PN}/${PN}/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DOCS=( CHANGELOG README TODO )

DEPEND="sys-libs/zlib
	>=sys-libs/ncurses-5.0:0="

RDEPEND="${DEPEND}"

PATCHES=(
		"${FILESDIR}/${P}-debug_aewl-warnings.patch"
		"${FILESDIR}/${P}-tinfo.patch"
		"${FILESDIR}/${P}-fix-incompatible-function-pointer-types.patch"
		"${FILESDIR}/${P}-fix-warnings.patch"
)

src_prepare() {
	default
	eautoreconf
}
