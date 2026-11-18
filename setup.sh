set -e

if [ ! -d .git ]; then
  git init
fi

sudo apt update
pip install --upgrade kaggle

kaggle auth login
gh auth login

git config user.email "qiuhaounn@gmail.com"

curl -fsSL https://pi.dev/install.sh | sh


