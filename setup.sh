#!/bin/bash
echo -e "install peda\n"
git clone https://github.com/longld/peda.git ~/peda

echo -e "install gef"
wget -q -O- https://github.com/hugsy/gef/raw/master/gef.sh | sh
wget -q -O ~/.gdbinit-gef.py https://github.com/hugsy/gef/raw/master/gef.py

echo -e "install gef"
git clone https://github.com/pwndbg/pwndbg ~/pwndbg
cd ~/pwndbg
./setup.sh

sudo cp gdb.sh /usr/bin/gdb.sh
sudo chmod +x /usr/bin/gdb.sh
