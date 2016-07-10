# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit user eutils

SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"
KEYWORDS="~amd64"

AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="GNUnet is a framework for secure peer-to-peer networking."
HOMEPAGE="http://gnunet.org/"
RESTRICT="test"

LICENSE="GPL-3"

SLOT="0"
IUSE="experimental http mysql nls postgres +sqlite X"

RDEPEND="
	>=net-misc/curl-7.21.0
	>=media-libs/libextractor-0.6.1
	>=dev-libs/libgcrypt-1.6
	>=dev-libs/libunistring-0.9.2
	net-misc/gnurl
	sys-libs/ncurses
	sys-libs/zlib
	http? ( >=net-libs/libmicrohttpd-0.9.18[messages] )
	mysql? ( >=virtual/mysql-5.1 )
	nls? ( sys-devel/gettext )
	postgres? ( >=dev-db/postgresql-server-8.3 )
	sqlite? ( >=dev-db/sqlite-3.0 )
	X? (
		x11-libs/libXt
		x11-libs/libXext
		x11-libs/libX11
		x11-libs/libXrandr
	)
"
DEPEND="
	${RDEPEND}
	sys-devel/automake:1.14
"

pkg_setup() {
	enewgroup gnunetdns
	enewuser  gnunet
}

src_prepare() {
	epatch "${FILESDIR}"/install-${PV}.diff
}

src_configure() {
	econf \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		$(use_enable nls) \
		$(use_enable experimental) \
		$(use_with http microhttpd) \
		$(use_with mysql) \
		$(use_with postgres) \
		$(use_with sqlite) \
		$(use_with X x)
}

src_compile() {
	MAKEOPTS="-j1" emake
}

src_install() {
	MAKEOPTS="-j1" emake DESTDIR="${D}" install
	newinitd "${FILESDIR}"/${P}.initd gnunet
	keepdir /var/{lib,log}/gnunet
	fowners gnunet:gnunet /var/lib/gnunet /var/log/gnunet
}

pkg_postinst() {
	einfo
	einfo "To configure"
	einfo "	 1) Add user(s) to the gnunet group"
	einfo "	 2) Edit the server config file '/etc/gnunet.conf'"
	einfo
}
