# search selected text in google with Contrl+Shift+g
# download g_for_google.sh file in home directory.
# sudo apt-get install xclip
# goto All Settings => Keyboard => Custom shortCuts => +
# in popup, name= g_for_google, command= sh g_for_google.sh hit apply.
# press on disable text(rightside) and  press.  Contrl+Shift+g # (to create new keybinding)
# Now select text from any window/screen press Contrl+Shift+g.

term=`xclip -out`
xdg-open https://google.com?q="$term"
