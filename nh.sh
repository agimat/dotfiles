# NH custom

if [[ $(hostname) == *"webair"* || $(hostname) == *"mojohost"* ]]; then
        if [ $(uname) == "FreeBSD" ]; then
            alias ap='cd $HOME/ap'
            alias at='cd $HOME/at'
            alias gfl='cd $HOME/ap/gflogin.com'
            alias nats='cd /www/virtual/media/nats/'
                if [[ $(hostname) == *"seav2"* ]]; then
                        alias xs='cd $HOME/ap/xs.amateurplatinum.com'
                else
                        alias xs='cd $HOME/ap/xs.amateurtraffic.com'
                        alias ta='cd $HOME/ap/teenieaccess.com/public_html'
                fi
        else
            alias rp='cd $HOME/rp'
            alias pr='cd $HOME/pr'
            alias rpnats='cd /home/httpd/nats/natsrp4/'
            alias prnats='cd /home/httpd/nats/natspr/'
                alias apnats='cd /home/httpd/nats/natsap/'
            alias vc='cd $HOME/rp/vicecrew.com/public_html'
            alias bn='cd $HOME/rp/boynetwork.com/public_html'
            alias ta='cd $HOME/at/teenieaccess.com/public_html'
        fi
fi

