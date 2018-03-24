# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

ANT_TASK_DEPNAME="jakarta-oro-2.0"

inherit ant-tasks

KEYWORDS="amd64 ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

DEPEND=">=dev-java/jakarta-oro-2.0.8-r2:2.0"
RDEPEND="${DEPEND}"
