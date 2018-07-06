# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic toolchain-funcs

MY_PN="vlan"

DESCRIPTION="802.1Q vlan control utility"
HOMEPAGE="http://www.candelatech.com/~greear/vlan.html"
SRC_URI="http://www.candelatech.com/~greear/vlan/${MY_PN}.${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE="static"

S=${WORKDIR}/${MY_PN}

src_compile() {
	use static && appened-ldflags -static
	emake purge
	emake CC="$(tc-getCC)" CCFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" STRIP="true" vconfig || die
}

src_install() {
	into /
	dosbin vconfig || die "dosbin error"

	sed -e "s:/usr/local/bin/vconfig:/sbin/vconfig:g" -i vlan_test.pl
	sed -e "s:/usr/local/bin/vconfig:/sbin/vconfig:g" -i vlan_test2.pl

	doman vconfig.8 || die "doman error"
	HTML_DOCS=( howto.html vlan.html )
	DOCS=( CHANGELOG README vlan_test*.pl )
	einstalldocs
}

pkg_postinst() {
	ewarn "MTU problems exist for many ethernet drivers."
	ewarn "Reduce the MTU on the interface to 1496 to work around them."
}
