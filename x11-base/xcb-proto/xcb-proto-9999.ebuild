# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1 meson multilib-minimal

DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="https://xcb.freedesktop.org/"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://anongit.freedesktop.org/git/xcb/proto.git"
	inherit git-r3
else
	SRC_URI="https://xcb.freedesktop.org/dist/${P}.tar.bz2"
	KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 ~sh sparc x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	dev-libs/libxml2"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

PATCHES=(
	"${FILESDIR}/"0001-xcbgen-subdir-python-module-to-lib.patch
	"${FILESDIR}/"0002-xcbgen-add-basic-setup.py.patch
	"${FILESDIR}/"0003-xcb-proto-add-meson-build-system.patch
)

src_prepare() {
	distutils-r1_src_prepare
}

multilib_src_configure() {
	local emesonargs=(
		-Dinstall-proto=$(multilib_is_native_abi && echo true || echo false)
	)
	meson_src_configure
}

multilib_src_compile() {
	if multilib_is_native_abi; then
		cd "${S}" || die
		distutils-r1_src_compile
	fi
}

multilib_src_install() {
	meson_src_install
	if multilib_is_native_abi; then
		cd "${S}" || die
		distutils-r1_src_install
	fi
}
