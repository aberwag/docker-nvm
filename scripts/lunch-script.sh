#!/usr/bin/env bash

echo "nvm configuration"
. ~/.nvm/nvm.sh

echo "install node v${NODE_VERSION}"
nvm install ${NODE_VERSION}

echo "else ## ${NODE_VERSION} eq $(node -v)"
nvm install ${NODE_VERSION}

nvm alias default ${NODE_VERSION}


# if (with node && ${NPM_VERSION} eq $(node -v))
echo "install npm v${NPM_VERSION}"
npm install -g npm@${NPM_VERSION}

echo "init repository: '${GIT_REPO}' to '${PROJECT_DIR}'"
# git clone ${GIT_REPO} $(pwd)${PROJECT_DIR}
git init
git remote add origin ${GIT_REPO}
git fetch origin
git checkout -b master --track origin/master

# echo "navigate to: '${PROJECT_DIR}'"
# cd $(pwd)${PROJECT_DIR}

echo "npm install"
npm install

echo "run command: '${NPM_CMD}'"
${NPM_CMD}
