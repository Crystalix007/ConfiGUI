# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
pkgname=configui-config
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A config provider for 'A UI for config changers'"
arch=('x86_64')
url="https://gitlab.com/sj1k/configui"
license=('MPL2')
groups=()
depends=()
makedepends=('tup')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("source/Tupfile"
        "source/ConfiGUI.cpp"
	"source/config.h"
	"source/config.cpp.def")
noextract=()
validpgpkeys=()
sha256sums=('2082b9c90359cac7182181a23face81c0736446c2c2dfd340d67c644551414de'
	    'SKIP'
	    'SKIP'
	    'SKIP')

prepare() {
	ln -sf "config.cpp.def" "config.cpp"
}

build() {
	mkdir -p default-build/
	cd default-build
	touch tup.config
	cd ..
	tup init
	tup default-build
}

check() {
	# cd "$pkgname-$pkgver"
	:
}

package() {
	cd "${srcdir}"
	install -Dm755 -t "${pkgdir}/usr/bin" default-build/configui-config
}
