#!/bin/bash
function Mode_change {
    name=$1
    gdbinitfile=~/.gdbinit

    # set with your own location
    peda="source ~/peda/peda.py"
    gef="source ~/.gdbinit_gef"
    pwndbg="source ~/pwndbg/gdbinit.py"
	if [ $name -eq "1" ];then
        tools=$peda
		echo -e "[\033[31m*\033[0m]Please enjoy the peda!\n"
	elif [ $name -eq "2" ];then
        tools=$gef
		echo -e "[\033[31m*\033[0m]Please enjoy the gef!\n"
	elif [ $name -eq "3" ];then
        tools=$pwndbg
		echo -e "[\033[31m*\033[0m]Please enjoy the pwndbg!\n"
	else
        tools="#for origin gdb"
		echo -e "[\033[31m*\033[0m]Use origin gdb!\n"
	fi
	echo $tools >> $gdbinitfile
}

function Mode_clear {
    location=$(cat $gdbinitfile|wc -l)
    sed -i "${location}d" $gdbinitfile
}

echo -e "Please choose one mode of GDB?\n1.peda    2.gef    3.pwndbg	4.gdb"
read -p "Input your choice:" num
if [ $num -eq "1" ] 2> /dev/null;then
	Mode_change $num
elif [ $num -eq "2" ] 2> /dev/null;then
	Mode_change $num
elif [ $num -eq "3" ] 2> /dev/null;then
	Mode_change $num
elif [ $num -eq "4" ] 2> /dev/null;then
	Mode_change $num
else
    echo -e "Error!\nPleasse input right number!"
    Mode_change 4
fi

gdb $1 $2 $3 $4 $5 $6 $7 $8 $9
Mode_clear