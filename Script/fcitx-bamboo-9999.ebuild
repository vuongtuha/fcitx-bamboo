# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg-utils cmake

if [[ "${PV}" =~ (^|\.)9999$ ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/fcitx/fcitx5-bamboo"
fi

MY_PN="fcitx5-bamboo"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_PN}-${PV}"
DESCRIPTION="Typing Vietnamese by Bamboo core engine for Fcitx5"
HOMEPAGE="https://github.com/fcitx/fcitx5-bamboo"
if [[ "${PV}" =~ (^|\.)9999$ ]]; then
	SRC_URI=""
else
	SRC_URI="https://download.fcitx-im.org/fcitx5/${MY_PN}/${MY_P}.tar.xz"
fi

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~amd64"
IUSE="+go"

DEPEND="
	app-i18n/fcitx:5
	app-i18n/fcitx-configtool:5
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/go
	kde-frameworks/extra-cmake-modules
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_LIBDIR="${EPREFIX}/usr/$(get_libdir)"
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
}
