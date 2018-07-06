# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Utilities for SAS management protocol (SMP)"
HOMEPAGE="http://sg.danny.cz/sg/smp_utils.html"
SRC_URI="http://sg.danny.cz/sg/p/${P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="static-libs"

DOCS=( AUTHORS ChangeLog COVERAGE CREDITS README )

PATCHES=(
	"${FILESDIR}"/${PN}-0.97-sysmacros.patch
)

src_configure() {
	econf $(use_enable static-libs static)
}
