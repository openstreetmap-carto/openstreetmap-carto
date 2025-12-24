#!/bin/sh
set -e

FONTDIR="./fonts"

mkdir -p "${FONTDIR}"

# download filename url
download() {
  ## Download if newer, and if curl fails, clean up and exit
  curl --fail --compressed -A "get-fonts.sh/osm-carto" -o "$1" -z "$1" -L "$2" || { echo "Failed to download $1 $2"; rm -f "$1"; exit 1; }
}

case "$1" in
  ja)
    download "${FONTDIR}/NotoSansCJKjp-Regular.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Regular.otf"
    download "${FONTDIR}/NotoSansCJKjp-Bold.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Bold.otf"
    sed -i "s/Noto Sans CJK \(JP\|KR\|SC\|TC\|HK\)/Noto Sans CJK JP/g" ./style/fonts.mss
    ;;
  ko)
    download "${FONTDIR}/NotoSansCJKkr-Regular.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Korean/NotoSansCJKkr-Regular.otf"
    download "${FONTDIR}/NotoSansCJKkr-Bold.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/Korean/NotoSansCJKkr-Bold.otf"
    sed -i "s/Noto Sans CJK \(JP\|KR\|SC\|TC\|HK\)/Noto Sans CJK KR/g" ./style/fonts.mss
    ;;
  zh-[Hh]ans)
    download "${FONTDIR}/NotoSansCJKsc-Regular.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf"
    download "${FONTDIR}/NotoSansCJKsc-Bold.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Bold.otf"
    sed -i "s/Noto Sans CJK \(JP\|KR\|SC\|TC\|HK\)/Noto Sans CJK SC/g" ./style/fonts.mss
    ;;
  zh-[Hh]ant-[Tt][Ww])
    download "${FONTDIR}/NotoSansCJKtc-Regular.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChinese/NotoSansCJKtc-Regular.otf"
    download "${FONTDIR}/NotoSansCJKtc-Bold.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChinese/NotoSansCJKtc-Bold.otf"
    sed -i "s/Noto Sans CJK \(JP\|KR\|SC\|TC\|HK\)/Noto Sans CJK TC/g" ./style/fonts.mss
    ;;
  zh-[Hh]ant-[Hh][Kk])
    download "${FONTDIR}/NotoSansCJKhk-Regular.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChineseHK/NotoSansCJKhk-Regular.otf"
    download "${FONTDIR}/NotoSansCJKhk-Bold.otf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/OTF/TraditionalChineseHK/NotoSansCJKhk-Bold.otf"
    sed -i "s/Noto Sans CJK \(JP\|KR\|SC\|TC\|HK\)/Noto Sans CJK HK/g" ./style/fonts.mss
    ;;
  *)
    echo "Usage: change-fonts-cjk.sh ja|ko|zh-Hans|zh-Hant-TW|zh-Hant-HK"
    exit 1
    ;;
esac

echo "Done."
