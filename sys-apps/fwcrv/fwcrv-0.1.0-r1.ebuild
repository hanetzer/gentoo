# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="FireWire CSR Config ROM Viewer"
HOMEPAGE="http://www.hugovil.com/en/fwcrv/"
SRC_URI="http://www.hugovil.com/repository/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc ~x86"
IUSE=""

DOCS=( AUTHORS README src/testdata.txt TODO )

RDEPEND="sys-libs/libraw1394"

PATCHES=(
	"${FILESDIR}"/${PN}-0.1.0-endian.patch
)
