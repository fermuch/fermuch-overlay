# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$
EAPI=5
PYTHON_COMPAT=( python2_7 )
MY_PV=${PV}
inherit distutils-r1 eutils
DESCRIPTION="Client/server to synchronize watching movies on mplayer/mpc on many computers."
HOMEPAGE="https://github.com/Syncplay/syncplay"
         https://github.com/Syncplay/${PN}/archive/${MY_PV}.tar.gz
SRC_URI="https://github.com/Syncplay/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+X +client +server"
DEPEND="
        X? ( dev-python/pyside[${PYTHON_USEDEP}] )
        dev-python/twisted-core[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}-${MY_PV}"
src_compile() {
        return
}
src_install() {
        use client && make PREFIX="${D}" install-client
        use server && make PREFIX="${D}" install-server
}
