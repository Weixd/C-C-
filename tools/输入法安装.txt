# 1、先安装fcitx：
sudo add-apt-repository ppa:wengxt/fcitx-nightly
sudo apt-get update
sudo apt-get install  fcitx

# 2、将fcitx设置为首选输入法：
# System Settings -> Language Support -> Keyboard input method system 选择 fcitx

# 3、安装中文输入法：
sudo apt-get install fcitx-sunpinyin
sudo apt-get install fcitx-googlepinyin

# 4、注销或者重启一下系统就可以使用了。Ctrl + Space 为切换输入法的快捷键
# PS：如果输入法选项里没有出现输入法，就需要到系统设置里设置一下: System Settings -> Text Entry -> add
