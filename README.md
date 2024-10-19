# 실행

```bash
[ -f "Rivalz.sh" ] && rm Rivalz.sh; wget -q https://raw.githubusercontent.com/byonjuk/Rivalz/refs/heads/main/Rivalz.sh && chmod +x Rivalz.sh && ./Rivalz.sh
```
이거 입력하면
![image](https://github.com/user-attachments/assets/3b9bbc3c-c908-497b-9618-92e7d019e08c)
이런 화면이 떠요. 1번을 하면 알아서 실행이 될 거에용. 설치가 완료되면 스크립트에 나온 것처럼

```bash
screen -S rivalz
```
를 입력한 뒤에 

```bash
rivalz run
```
를 입력해서 요구하는 정보들을 입력해 주세요. 

아마
1. 지갑 주소
2. 코어 (1개만 하셈)
3. RAM (1기가만 하셈 ㅎㅎ)
4. 디스크타입 선택 (sda 3으로)
5. 용량 설정 (적당히, 풀로 박지 마셈.)
하면 끝~!

[대쉬보드 보는 곳](https://rivalz.ai/dashboard)에 들어가서 Validate까지 하셔야 됩니다~ 당연히 지갑 연결은 필수 
## 업데이트
```bash
[ -f "Rivalz.sh" ] && rm Rivalz.sh; wget -q https://raw.githubusercontent.com/byonjuk/Rivalz/refs/heads/main/Rivalz.sh && chmod +x Rivalz.sh && ./Rivalz.sh
```
이거 입력하면
![image](https://github.com/user-attachments/assets/3b9bbc3c-c908-497b-9618-92e7d019e08c)
이런 화면이 떠요. 2번을 하면 알아서 실행이 될 거에요.
이후에

```bash
screen -S rivalz
```
를 입력한 뒤에 

```bash
rivalz run
```
를 입력해서 요구하는 정보들을 입력해 주세요. 

아마
1. 코어 (1개만 하셈)
2. RAM (1기가만 하셈 ㅎㅎ)
3. 디스크타입 선택 (sda 3으로)
4. 용량 설정 (적당히, 풀로 박지 마셈.)
하면 끝~!

[대쉬보드 보는 곳](https://rivalz.ai/dashboard)으로 들어가서 잘 돌아가는지도 체크하세용 ㅎㅎ

## 라이벌즈 노드 삭제.
개인적으론 수동으로 하는 걸 추천함. 근데 진짜 모르겠다 싶으면 삭제 명령어 돌려보시길(저두 아직 실행 안 해봤음 ㅠ)

```bash
sudo rm -rf ~/.fnm
sudo rm -rf "$XDG_DATA_HOME/fnm"
sudo rm -rf "$HOME/Library/Application Support/fnm"
sudo rm -rf ~/.local/share/fnm
sudo rm -rf /root/.rivalz
```

이후 

```bash
nano $HOME/.bashrc
```
```bash
nano $HOME/.bashrc
```
```bash
nano $HOME/.bashrc
```
이 세 곳을 각각 입력해서(만약 파일이 없다고 뜨면 상관없으니 무시)

```bash
# fnm
FNM_PATH="..."
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "fnm env"
fi
```
이 내용을 삭제하셔야 됨. 삭제를 완료했으면

```bash
source ~/.bashrc
source ~/.zshrc
```
이걸 복사해서 붙여넣으면 끝~

그닥 어렵지 않으니까~ 혼자서 해보시는 거 추천...

진짜 모르겠으면. 

```bash
[ -f "Rivalz.sh" ] && rm Rivalz.sh; wget -q https://raw.githubusercontent.com/byonjuk/Rivalz/refs/heads/main/Rivalz.sh && chmod +x Rivalz.sh && ./Rivalz.sh
```
이거 입력하면
![image](https://github.com/user-attachments/assets/3b9bbc3c-c908-497b-9618-92e7d019e08c)
이런 화면이 떠요. 3번을 하면 삭제가 진행될 건데요...

삭제 진행하고 난 뒤에
```bash
cat ~/.bashrc
```
를 입력해서? 내용이 제대로 뜨는지 보고, 만약 파일이 없다느니 혹은 아무 내용이 안 뜨면.

```bash
mv ~/.bashrc.bak ~/.bashrc
mv ~/.zshrc.bak ~/.zshrc
mv ~/.config/fish/conf.d/fnm.fish.bak ~/.config/fish/conf.d/fnm.fish
```
를 입력해서 이전 파일을 복붙해 주세요~

그러고서 다시 수동으로
```bash
nano $HOME/.bashrc
```
```bash
nano $HOME/.bashrc
```
```bash
nano $HOME/.bashrc
```
이 세 곳을 각각 입력해서(만약 파일이 없다고 뜨면 상관없으니 무시)

```bash
# fnm
FNM_PATH="..."
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "fnm env"
fi
```
이 내용을 삭제하셔야 됨. 삭제를 완료했으면

```bash
source ~/.bashrc
source ~/.zshrc
```
이걸 복사해서 파일에 붙여 넣으면 끝~
