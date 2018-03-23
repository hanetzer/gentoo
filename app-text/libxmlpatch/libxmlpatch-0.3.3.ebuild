# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A set of tools to create and apply patch to XML files using XPath"
HOMEPAGE="http://xmlpatch.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/lib}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test static-libs"

RDEPEND="dev-libs/glib:2
	dev-libs/libxml2"
DEPEND="${RDEPEND}
	test? ( dev-libs/check )
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${PN}-0.3.3-gentoo.patch
)

src_prepare() {
	default
	mv configure.{in,ac} || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_with test check)
}

DOCS=( LEGAL_NOTICE README TODO ChangeLog )

src_install() {
	default

	find "${ED}" -name '*.la' -delete || die
}
