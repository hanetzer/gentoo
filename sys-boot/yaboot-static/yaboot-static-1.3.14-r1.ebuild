# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Generated by using quickpkg on a ppc32 machine, compiled with -O2 -pipe.

EAPI=5

inherit eutils

DESCRIPTION="Static yaboot ppc boot loader for machines with open firmware"
HOMEPAGE="http://yaboot.ozlabs.org/"
SRC_URI="mirror://gentoo/yaboot-static-${PV}.tbz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ppc ppc64"
IUSE="ibm"

DEPEND="sys-apps/powerpc-utils"
RDEPEND="!sys-boot/yaboot
	!ibm? (
		sys-fs/hfsutils
		sys-fs/hfsplusutils
		sys-fs/mac-fdisk
	)"

S=${WORKDIR}

QA_PRESTRIPPED="
	/usr/lib/yaboot/yaboot
	/usr/lib/yaboot/yaboot.chrp
	/usr/lib/yaboot/addnote
"

src_prepare() {
	epatch "${FILESDIR}"/sysfs-ofpath.patch
}

src_install() {
	# don't blow away the user's old conf file
	mv "${WORKDIR}"/etc/yaboot.conf{,.sample} || die
	cp -pPR "${WORKDIR}"/* "${D}" || die
}
