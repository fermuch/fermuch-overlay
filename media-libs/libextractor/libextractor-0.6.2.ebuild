# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libextractor/libextractor-0.5.20c.ebuild,v 1.2 2009/12/29 17:43:47 armin76 Exp $

inherit libtool

DESCRIPTION="A library used to extract meta data from files of arbitrary type."
HOMEPAGE="http://www.gnu.org/software/libextractor/"
SRC_URI="http://ftpmirror.gnu.org/${PN}/${P}.tar.gz"

IUSE="nls gtk gsf qt vorbis ffmpeg mpeg2 pdf"
SLOT="0"
LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~sparc ~x86"
RESTRICT="test"

DEPEND=">=sys-devel/libtool-2.2
	sys-libs/zlib
	sys-devel/gettext
	>=dev-libs/glib-2.0.0
	nls? ( virtual/libintl )
	gtk? ( >=x11-libs/gtk+-2.6.0 )
	gsf? ( gnome-extra/libgsf )
	qt? ( >=x11-libs/qt-svg-4 )
	vorbis? ( media-libs/libvorbis )
	ffmpeg? ( media-video/ffmpeg )
	mpeg2? ( media-libs/libmpeg2 )
	pdf? ( app-text/poppler )"
RDEPEND=""

src_compile() {
	elibtoolize
	econf \
		$(use_enable nls) \
		$(use_enable glib) \
		$(use_enable gsf) \
		$(use_enable ffmpeg) \
		|| die "econf failed"

	emake -j1 || die "emake failed"
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
}
