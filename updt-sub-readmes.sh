#!/bin/bash

# Verifica se um parâmetro foi fornecido e se o branch existe <<<<<
if [ -z "$1" ]; then
  echo "Por favor, forneça um branch."
  exit 1
fi

# verifica se o branch existe
if git show-ref --verify --quiet refs/heads/"$1"; then
    echo "Branch existe"
else
    echo "Branch não existe"
    exit 1
fi

# Armazena o parâmetro em uma variável (opcional)
branch=$1

# Exibe o parâmetro
echo "O branch fornecido foi: $branch"

# Faz switch para o branch
echo "git switch $branch..."
git switch "$branch"

# Busca o README de main: 
#echo "git restore --source main README.md..."
#git restore --source main README.md

# Abre o meld para edição do README do branch
echo "Abrindo meld para edição do README de $branch..."
git show main:README.md > /tmp/readme
meld /tmp/readme "$branch"/README.md

# Ao fechar o meld, faz novo restore do README do main
# echo "git restore README.md..."
# git restore README.md

# Faz commit no README do branch
echo "git commit -am "$branch"/README.md..."

