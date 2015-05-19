# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/rtl8180/rtl8180-0.22_pre20050528.ebuild,v 1.5 2007/07/07 10:55:27 genstef Exp $

inherit autotools eutils linux-mod eutils git-2

DESCRIPTION="Driver for the rtl8188eu wireless chipset"
HOMEPAGE="https://github.com/lwfinger/rtl8188eu"
SRC_URI=""
EGIT_REPO_URI="git://github.com/lwfinger/rtl8188eu"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-wireless/wireless-tools"

MODULE_NAMES="8188eu(net:)"
BUILD_TARGETS="all"

pkg_setup() {
  linux-mod_pkg_setup
}

src_install() {
  linux-mod_src_install
  emake \
    DESTDIR="${D}" \
    docdir="${EPREFIX}"/usr/share/doc/${PF} \
    install
  dodoc README.md
}