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
source=("Tupfile"
        "ConfiGUI.cpp"
	"config.h"
	"config.cpp.def"
	"Util.h"
	"Util.cpp"
	"SetKonsoleTheme.sh"
	"SetTheme.sh"
	"ColourDisplay.sh")
noextract=()
validpgpkeys=()
sha256sums=('96931e77f72dd310bcefac95b28698a40409e2b755b2069979066cce122ba82f'
	    '3fda5017dff79fe6873fff73a188b8b58c44178a13a8b04aee9cab765df5555c'
	    '488d6e73b1a8b684a5deade5c5909d233d276efb24ac1c1f61926899c48633a4'
	    'f893f938b1c558243d9688c923f462f207e550c66dc302a135c49d5b7ec77e7f'
	    '565483dc1eba76d688d60845bfe7211f3264f8ce1181ff5079f9f53ca980803a'
	    'c99a2fde356ac0a0b1c2ce6eb6d7b6479eda796071d6bab74143e3594f9fdbee'
	    'ba7f963ebff2a8056c734646100d0a379aae055a67847d74620442c8ddd7bac0'
	    '90e82d629c23616200767923d3d9bb366f28c9e51935f19884158e15fe7dff3f'
	    '67d9dbef0f624d844521a7b33aa9e33347835925c2a9713488ff33c3e08141c3')

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
	install -Dm775 -t "${pkgdir}/usr/bin" SetKonsoleTheme.sh
	install -Dm775 -t "${pkgdir}/usr/bin" SetTheme.sh
	install -Dm775 -t "${pkgdir}/usr/bin" ColourDisplay.sh
}
