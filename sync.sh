set -e


### pi ###
pi_dir="./pi-config"
if [ -d ${pi_dir} ]; then
  rm -rf ${pi_dir}
fi
git clone https://github.com/Another-Chris/.pi.git ${pi_dir}

(cd "${pi_dir}" && git ls-files --cached --others --exclude-standard -- agent) | while IFS= read -r f; do
  rel="${f#agent/}"
  mkdir -p "${HOME}/.pi/agent/$(dirname "${rel}")"
  cp "${pi_dir}/${f}" "${HOME}/.pi/agent/${rel}"
done

rm -rf ${pi_dir}

### skills ###
skills_dir="./skills-config"
if [ -d ${skills_dir} ]; then
  rm -rf ${skills_dir}
fi
git clone https://github.com/Another-Chris/.agents.git ${skills_dir}
cp -r ${skills_dir} ${HOME}/.agents
rm -rf ${skills_dir}


### tmux ###
now_tmux_conf="${HOME}/.tmux.conf"
if [ -f ${now_tmux_conf} ]; then
	rm ${now_tmux_conf}
fi
if [ -d "${HOME}/.config/tmux" ]; then
  rm -rf ${HOME}/.config/tmux
fi
git clone https://github.com/Another-Chris/tmux.git ${HOME}/.config/tmux
tmux source-file ${HOME}/.config/tmux/tmux.conf

### vim ###
now_vim_conf="${HOME}/.vimrc"
if [ -f ${now_vim_conf} ]; then
	rm ${now_vim_conf}
fi
if [ ! -d "${HOME}/.config/vim" ]; then
	git clone https://github.com/Another-Chris/vim_config.git ${HOME}/.config/vim
fi
cp ${HOME}/.config/vim/vimrc ~/.vimrc
cp -r ${HOME}/.config/vim/ ~/.vim
