#!/usr/bin/env bash

# I wrote this post-build deploy stuff for a job interview challenge.
# It's not used anymore but the code is pretty nifty so I'm keeping it for posterity.

set -e

wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
unzip packer_1.2.5_linux_amd64.zip

./packer validate post-build/jumper.json
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin
eval $(aws ecr get-login --no-include-email --region us-west-2)
./packer build post-build/jumper.json
