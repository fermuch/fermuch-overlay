
inherit autotools eutils git-2

DESCRIPTION="Secure Socket Funneling - Network tool and toolkit"
HOMEPAGE="https://securesocketfunneling.github.io/ssf/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/securesocketfunneling/ssf.git"
LICENSE=""

KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
  >=dev-libs/boost-1.56.0
  >=dev-libs/openssl-1.0.2d
  >=dev-cpp/gtest-1.7.0
  >=dev-util/cmake-2.8.12.2-r1
  >=dev-lang/perl-5.20
  
"

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