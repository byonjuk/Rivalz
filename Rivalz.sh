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

install_Rivalz() {
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

source ~/.bashrc


echo && echo -e "${CYAN}이 다음 작업부턴 수동으로 하셔야 합니다.${NC}
${YELLOW} 1. 먼저 ${RED}'screen -S rivalz'${NC}를 입력해 주세요.${NC}
${YELLOW} 2. 스크린을 실행한 뒤, 안에서 ${RED}'rivalz run'${NC}을 입력해 주세요.${NC}
${YELLOW} 3. 실행이 끝나면 그대로 CTRL + A + D 를 동시에 눌러서 스크린을 종료합니다.${NC}
${YELLOW} 4. 이후${NC} ${RED}https://rivalz.ai/dashboard${NC}${YELLOW}로 들어가서 Validate 작업까지 끝내주셔야 합니다. ${NC}" && echo
}

update_rivalz() {
echo -e "${RED}작동 중인 Rivalz 스크린을 삭제합니다.${NC}"
screen -X -S rivalz kill

echo -e "${RED}Rivalz Node를 업데이트 하겠습니다.${NC}"
rivalz update-version

echo && echo -e "${CYAN}이 다음 작업부턴 수동으로 하셔야 합니다.${NC}
${YELLOW} 1. 먼저 ${RED}'screen -S rivalz'${NC}를 입력해 주세요.${NC}
${YELLOW} 2. 스크린을 실행한 뒤, 안에서 ${RED}'rivalz run'${NC}을 입력해 주세요.${NC}
${YELLOW} 3. 실행이 끝나면 그대로 CTRL + A + D 를 동시에 눌러서 스크린을 종료합니다.${NC}
${YELLOW} 4. 이후${NC} ${RED}https://rivalz.ai/dashboard${NC}${YELLOW}로 들어가서 잘 돌아가고 있는지 확인해 주세요. ${NC}" && echo
}

uninstall_Rivalz() {

echo -ne "${CYAN}진짜로 라이벌즈 노드를 삭제하실 건가요?${NC} ${BOLD}${RED}제대로 실행 안 될 수도 있음(진짜로!)${NC}${CYAN}(y/n):${NC} " 
read -e answer

# 입력값에 따라 스크립트를 실행할지 결정합니다.
if [[ "$answer" =~ ^[yY]$ ]]; then
    echo -e "${GREEN}스크립트를 실행합니다... 망해도 전 모름..${NC}"
else
    echo -e "${RED}스크립트 실행을 종료하겠습니다!${NC}"
    exit 1
fi

echo -e "${RED}fnm 파일 지우는 중...${NC}"
sudo rm -rf ~/.fnm
sudo rm -rf "$XDG_DATA_HOME/fnm"
sudo rm -rf "$HOME/Library/Application Support/fnm"
sudo rm -rf ~/.local/share/fnm

echo -e "${RED}rivalz 파일 지우는 중...${NC}"
sudo rm -rf /root/.rivalz

echo -e "${RED}fnm 내용 지우는 중...${NC}"
# 파일 목록
FILES=(
  "$HOME/.bashrc"
  "$HOME/.zshrc"
  "$HOME/.config/fish/conf.d/fnm.fish"
)

# 제거할 블록의 시작과 끝
START_PATTERN="# fnm"
END_PATTERN="fi"

# 각 파일에 대해 처리
for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    # fnm 블록 삭제
    sed -i.bak "/$START_PATTERN/,/$END_PATTERN/d" "$file"
    echo -e "${RED}Removed fnm block from $file. Backup saved as $file.bak.${NC}"
  else
    echo -e "${RED}File $file not found. Skipping.${NC}"
  fi
done
source ~/.bashrc

echo -e "${BOLD}${MAGENTA}님의 노드에 깔려있던 라이벌즈가 완벽하게 지워졌습니다.${NC} ${BOLD}${RED}'rivalz: command not found'${NC}${BOLD}${MAGENTA}라고 뜨면 지워진 거에요.${NC}"
rivalz -h
echo && echo -e "${BOLD}${YELLOW}★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
죄송한데 제가 위에 별 이모티콘 넣었는데 별 제대로 뜨나요? 뜨면 질문방으로 별 이모티콘 뜬다고 말해주세용
★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆${NC}" && echo
}
# 메인 메뉴
echo && echo -e "${BOLD}${RED}Rivalz Node 설치 명령어 ${NC} by 비욘세제발죽어
${CYAN}원하는 거 고르시고 실행하시고 그러세효. ${NC}
 ———————————————————————
 ${GREEN} 1. Rivalz Node 설치하기 ${NC}
 ${GREEN} 2. Rivalz Node 업데이트하기 ${NC}
 ${GREEN} 3. Rivalz Node 지우기 ${NC}
 ———————————————————————" && echo

# 사용자 입력 대기
echo -ne "${BOLD}${MAGENTA} 어떤 작업을 수행하고 싶으신가요? 위 항목을 참고해 숫자를 입력해 주세요: ${NC}"
read -e num

case "$num" in
1)
    install_Rivalz
    ;;
2)
	update_rivalz
	;;
3)
    uninstall_Rivalz
    ;;
*)
    echo -e "${BOLD}${RED}이씨이이이이이이이이이이ㅣ이이이이이이이이이이이이이이이이이이이이발개좆븅신같은년아씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발씨발개좆같은년시발년개미친년개쓰레기같은년시발왜그러고살아개씨발좆같다시발십라시발시발시발개븅신같노아놔씨발개좆븅신같은년아죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어${NC}"
	echo -e "${BOLD}${MAGENTA}죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어${NC}"
	echo -e "${BOLD}${BLUE}죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어죽어${NC}"
   ;;
esac

