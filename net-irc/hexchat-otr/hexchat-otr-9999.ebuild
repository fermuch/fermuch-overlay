# Copyright 1999-2015 Fernando Mumbach
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit autotools eutils git-2

DESCRIPTION="Off-The-Record messaging (OTR) for hexchat"
HOMEPAGE="https://github.com/TingPing/hexchat-otr"

SRC_URI=""
EGIT_REPO_URI="git://github.com/TingPing/hexchat-otr"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

RDEPEND="net-libs/libotr
  dev-libs/glib
  net-irc/hexchat
  dev-libs/libgcrypt:0"

DEPEND="${RDEPEND}
  virtual/pkgconfig
  dev-lang/python"


src_prepare() {
  eautoreconf
}

src_configure() {
  econf
}

src_install() {
  emake \
    DESTDIR="${D}" \
    docdir="${EPREFIX}"/usr/share/doc/${PF} \
    install

  dodoc Readme.md LICENSE
}