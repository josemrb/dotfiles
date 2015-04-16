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

git clone https://github.com/josemrb/rbenv-ripper-tags.git $HOME/.rbenv/plugins/rbenv-ripper-tags
cd $HOME/.rbenv/plugins/ruby-build
git fetch --tags
local rb
rb=$(git describe --tags | cut --delimiter="-" -f1)
git checkout $rb
cat <<EOF > $HOME/.rbenv/default-gems
gem-ripper-tags
bundler
gem-browse
EOF

cat <<EOF > $HOME/.gemrc
gem: --no-document
EOF

exit 0
