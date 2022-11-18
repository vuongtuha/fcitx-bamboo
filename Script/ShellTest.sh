#!/usr/bin/env bash
cd $HOME/Downloads/
git clone \
                                       --depth 1  \
                                       --filter=blob:none  \
                                       --sparse \
                                       https://github.com/vuongtuha/fcitx-bamboo \
                                 ;
cd fcitx-bamboo;
git sparse-checkout set Script;
sudo eselect repository enable gentoo-zh && sudo emerge --sync;
sudo mkdir -p /var/db/repos/gentoo-zh/app-i18n/fcitx-bamboo/;
sudo cp $HOME/Downloads/fcitx-bamboo/Script/fcitx-bamboo-1.0.1.ebuild /var/db/repos/gentoo-zh/app-i18n/fcitx-bamboo/;
cd /var/db/repos/gentoo-zh/app-i18n/fcitx-bamboo/;
sudo ebuild fcitx-bamboo-1.0.1.ebuild digest && sudo ebuild fcitx-bamboo-1.0.1.ebuild manifest;
sudo emerge app-i18n/fcitx-bamboo::gentoo-zh
exit 1

