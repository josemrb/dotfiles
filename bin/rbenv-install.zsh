#!/usr/bin/env zsh

git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
cd $HOME/.rbenv
git fetch --tags
local rbenv
rbenv=$(git describe --tags | cut --delimiter="-" -f1)
git checkout $rbenv

git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
cd $HOME/.rbenv/plugins/ruby-build
git fetch --tags
local rb
rb=$(git describe --tags | cut --delimiter="-" -f1)
git checkout $rb

#git clone https://github.com/sstephenson/rbenv-default-gems.git $HOME/.rbenv/plugins/rbenv-default-gems
#cd $HOME/.rbenv/plugins/rbenv-default-gems
#git fetch --tags
#local rdg
#rdg=$(git describe --tags | cut --delimiter="-" -f1)
#git checkout $rdg

cat <<EOF > $HOME/.rbenv/default-gems 
bundler
ripper-tags
gem-browse
gem-ctags
EOF

exit 0
