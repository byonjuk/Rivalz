#!/bin/bash

BOLD='\033[1m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
CYAN='\033[36m'
MAGENTA='\033[35m'
NC='\033[0m'

# 한국어 체크하기
check_korean_support() {
    if locale -a | grep -q "ko_KR.utf8"; then
        return 0  # Korean support is installed
    else
        return 1  # Korean support is not installed
    fi
}

# 한국어 IF
if check_korean_support; then
    echo -e "${CYAN}한글있긔 설치넘기긔.${NC}"
else
    echo -e "${CYAN}한글없긔, 설치하겠긔.${NC}"
    sudo apt-get install language-pack-ko -y
    sudo locale-gen ko_KR.UTF-8
    sudo update-locale LANG=ko_KR.UTF-8 LC_MESSAGES=POSIX
    echo -e "${CYAN}설치 완료했긔.${NC}"
fi

# commands

echo -e "${BOLD}${RED}이전에 라이벌즈 깔려있던 거 삭제하기${NC}"
sudo rm -rf /root/.rivalz

echo -e "${CYAN}sudo apt-get update && sudo apt-get install -y zip unzip${NC}"
sudo apt-get update && sudo apt-get install -y zip unzip

echo -e "${CYAN}curl -fsSL https://fnm.vercel.app/install | bash${NC}"
curl -fsSL https://fnm.vercel.app/install | bash

# Add fnm to the current shell session
export PATH="/root/.local/share/fnm:$PATH"
eval "`fnm env`"


echo -e "${CYAN}fnm use --install-if-missing 20${NC}"
fnm use --install-if-missing 20

echo -e "${CYAN}npm i -g rivalz-node-cli${NC}"
npm i -g rivalz-node-cli

node -v

npm -v

rivalz -h


echo -e "${CYAN}라이벌즈를 실행하겠습니다.${NC}"
rivalz run

echo -e "${RED}https://rivalz.ai/dashboard 에 들어가서 validate까지 해주세요.${NC}"

