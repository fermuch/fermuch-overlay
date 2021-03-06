# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/gnunet-gtk/gnunet-gtk-0.8.1.ebuild,v 1.1 2010/01/29 14:03:29 patrick Exp $

MY_P=${PN}-${PV/_/}
S="${WORKDIR}/${MY_P}"
DESCRIPTION="Graphical front end for GNUnet."
HOMEPAGE="http://gnunet.org/"
SRC_URI="ftp://ftp.gnu.org/gnu/gnunet/${MY_P}.tar.gz"

KEYWORDS="~amd64 ~ppc64 ~x86"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.20.0
	>=net-p2p/gnunet-${PV}
	>=dev-util/glade-3.0"

src_compile() {
	econf --with-gnunet=/usr || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
