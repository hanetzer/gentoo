# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eapi7-ver

MY_P=${PN}_$(ver_rs 2 '-')

DESCRIPTION="Miscellaneous utilities for nevow and twisted.web programming"
HOMEPAGE="http://www.inoi.fi/open/trac/webut"
SRC_URI="mirror://debian/pool/main/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE="examples"

RDEPEND=">=dev-python/nevow-0.9.18[${PYTHON_USEDEP}]
	>=dev-python/twisted-core-2[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-3.0.1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-$(ver_cut 1-2)"

python_install_all() {
	use examples && local EXAMPLES=( examples/. )
	distutils-r1_python_install_all
}
