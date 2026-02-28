# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="
	A small library that optimizes some niche operations commonly used by
	debugger extensions.
"
HOMEPAGE="
	https://github.com/pwndbg/niche-elf
"

SRC_URI="https://github.com/pwndbg/niche-elf/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

PATCHES=(
	"${FILESDIR}"/${PN}-build-system.patch
)

BDEPEND="${DISTUTILS_DEPS}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
