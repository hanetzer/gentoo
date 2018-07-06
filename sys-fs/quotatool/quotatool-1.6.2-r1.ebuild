# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="command-line utility for filesystem quotas"
HOMEPAGE="https://quotatool.ekenberg.se/"
SRC_URI="https://quotatool.ekenberg.se/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="sys-fs/quota"

PATCHES=(
	"${FILESDIR}"/${PN}-1.4.13-ldflags.patch
)

src_install () {
	dodir /usr/sbin /usr/share/man/man8
	default
}
