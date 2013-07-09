#!/bin/bash
#
if [ ! $# -eq 5 ]; then
    echo "Usage: sh $0 commond ip user_name password pre-PASSCODE"
    echo "exsample: sh $0 to_168 192.168.0.168 huqiu rzxlszyysppgqc yqqlmgs1cl"
    echo ''
fi
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
fi
dir=`pwd`
cp -f files/ssh_config ~/.ssh/ssh_config
chmod 400 ~/.ssh/ssh_config

commond=$1
ip=$2
user_name=$3
password=$4
pre_passcode=$5

cat > "$commond.sh" <<EOF
#!/bin/bash
host="$ip"
user="huqiu"
password="$password"
prePASSCODE="$pre_passcode"
cd files
./auto_login.sh \$host \$user \$password \$prePASSCODE
EOF
chmod u+x $commond.sh

if ! grep -q "alias $commond" ~/.bashrc; then
    echo alias $commond="$dir/$commond.sh" >> ~/.bashrc
fi
