# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true

export PATH="$HOME/.cargo/bin:$PATH"

source /home/pi/scripts/main.sh
