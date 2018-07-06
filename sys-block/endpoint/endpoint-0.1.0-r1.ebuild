# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Endpoint turns a Linux machine with a firewire card into an SBP-2 device"
HOMEPAGE="https://oss.oracle.com/projects/endpoint/"
SRC_URI="https://oss.oracle.com/projects/endpoint/dist/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=">=sys-libs/libraw1394-0.9
	>=dev-libs/glib-2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${PN}-0.1.0-errormessages.patch
)

src_install() {
	default
	insinto /etc
	newins docs/sample-endpoint.conf endpoint.conf
}
