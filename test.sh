echo "1️⃣ /4 Exporting PSDs"
# npm install -g psd-cli
for filename in icons/*.psd; do
    [ -e "$filename" ] || continue
    echo "  Converting $filename to a PNG"
    psd -c $filename > /dev/null
done

echo "2️⃣ /4 Cleaning up"
rm -rf deb/Library/Themes/thelmgn.theme/IconBundles/
mkdir deb/Library/Themes/thelmgn.theme/IconBundles/

echo "️3️⃣ /4 Moving PNGs"
mv icons/Icon.png deb/Library/Themes/thelmgn.theme/Icon.png
mv icons/*.png deb/Library/Themes/thelmgn.theme/IconBundles/

echo "4️⃣ /4 Copying to iPhone"
rm -rf /Volumes/iPhone\ icons/IconBundles/
mkdir /Volumes/iPhone\ icons/IconBundles/
cp -r deb/Library/Themes/thelmgn.theme/IconBundles/ /Volumes/iPhone\ icons/IconBundles/