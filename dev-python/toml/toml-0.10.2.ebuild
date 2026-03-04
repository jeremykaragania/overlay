# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{3..13} )

inherit distutils-r1

DESCRIPTION="Python Library for Tom's Obvious, Minimal Language"
HOMEPAGE="
	https://github.com/uiri/toml/
"

SRC_URI="https://github.com/uiri/toml/archive/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-tags-${PV}/"

python_test() {
	${EPYTHON} ./tests/decoding_test.py || die
}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
