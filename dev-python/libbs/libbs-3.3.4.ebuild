# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Your Only Decompiler API Lib - A generic API to script in and out of decompilers"
HOMEPAGE="
	https://github.com/binsync/libbs
"

SRC_URI="https://github.com/binsync/libbs/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

RDEPEND="
	dev-python/toml[${PYTHON_USEDEP}]
	dev-python/ply[${PYTHON_USEDEP}]
	<dev-python/pycparser-3.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/prompt-toolkit[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pyghidra[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
