# Description from http://www-zeuthen.desy.de/~kislat/icetray/zshenv.html
# .zshenv is being sourced in every zsh session, while .zshrc is only used in interactive sessions, i.e. when you open a shell on your computer
# There is one tricky thing about .zshenv: There must not be any output during .zshenv

# From https://github.com/sstephenson/rbenv/
# From https://github.com/mojombo/jekyll/wiki/install & https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python:
# export PATH=/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:${PATH}
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
