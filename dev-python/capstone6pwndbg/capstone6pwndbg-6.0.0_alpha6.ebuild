# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="fork capstone6 only for pwndbg"
HOMEPAGE="
	https://github.com/pwndbg/capstone6pwndbg
"

MY_PV="${PV}"
MY_PV="${MY_PV/_alpha/-Alpha}"
MY_PV="${MY_PV/_beta/-Beta}"
MY_PV="${MY_PV/_rc/-rc}"

SRC_URI="
	https://github.com/capstone-engine/capstone/archive/${MY_PV}.tar.gz -> capstone-${PV}.tar.gz
	https://github.com/pwndbg/capstone6pwndbg/archive/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz
"

S="${WORKDIR}/capstone-${MY_PV}/bindings/python"

PATCHES=(
	${WORKDIR}/${PN}-tags-v${MY_PV}/python-rename.patch
)

src_prepare() {
	pushd "${WORKDIR}/capstone-${MY_PV}" >/dev/null || die
	default
	popd >/dev/null || die
}

src_compile() {
	# Setting `LIBCAPSTONE_PATH` disables building the capstone native core.
	LIBCAPSTONE_PATH=1 distutils-r1_src_compile
}

python_test() {
	./tests/test_all.py || die
	./tests/test_iter.py || die
}

RDEPEND="
	=dev-libs/capstone-6.0.0_alpha6
"

BDEPEND="${DISTUTILS_DEPS}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~x86"
