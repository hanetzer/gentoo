# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib-minimal

DESCRIPTION="library that provides direct access to the IEEE 1394 bus"
HOMEPAGE="https://ieee1394.wiki.kernel.org/"
SRC_URI="mirror://kernel/linux/libs/ieee1394/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE="static-libs"

DEPEND="app-arch/xz-utils"
RDEPEND=""

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf $(use_enable static-libs static)
}

multilib_src_install() {
	default
	find "${ED}" -name '*.la' -delete
}
