#!/usr/bin/env zsh

git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
cd $HOME/.rbenv
git fetch --tags
local rbenv
rbenv=$(git describe --tags | cut --delimiter="-" -f1)
git checkout $rbenv

git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
cd $HOME/.rbenv/plugins/ruby-build
git fetch --tags
local rb
rb=$(git describe --tags | cut --delimiter="-" -f1)
git checkout $rb

git clone https://github.com/rbenv/rbenv-default-gems.git $HOME/.rbenv/plugins/rbenv-default-gems
cat <<EOF > $HOME/.rbenv/default-gems
awesome_print
bundler
byebug
looksee
pry
pry-debundle
pry-byebug
pry-doc
pry-rescue
pry-stack_explorer
ripper-tags
gem-ripper-tags
gem-browse
EOF

cat <<EOF > $HOME/.gemrc
gem: --no-document
EOF

exit 0
