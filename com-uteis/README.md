<!--
" Badges ------------------ {{{
-->
<!-- Estes badges só funcionarão quando o repositório do github for público -->
![GitHub repo size](https://img.shields.io/github/repo-size/ernanikern70/Git-Tutorial?label=Repo%20size&style=flat-round&logo=github) 
![GitHub branch status](https://img.shields.io/github/checks-status/ernanikern70/Git-Tutorial/main) 
![Last commit](https://img.shields.io/github/last-commit/ernanikern70/Git-Tutorial?label=Last%20commit&style=flat-round&color=green) 
![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/ernanikern70/Git-Tutorial)
![GitHub Issues or Pull Requests](https://img.shields.io/github/issues-pr/ernanikern70/Git-Tutorial)
![GitHub stars](https://img.shields.io/github/stars/ernanikern70/Git-Tutorial?label=%E2%AD%90%20Stars&style=flat-square&color=yellow)
![GitHub followers](https://img.shields.io/github/followers/ernanikern70) 
<!--
" }}}
-->
<!--
" Introdução --------------------------- {{{
-->
# Guia Rápido: Projeto com Git e GitHub

Este guia descreve os passos recomendados para criar um projeto versionado com Git, conectado ao GitHub - ideal para projetos Ansible ou qualquer outro.

---
<!--
" }}}
-->
<!--
" Comandos úteis --------------------- {{{
-->
## Comandos úteis

- Clonar um repositório remoto: 
  ```
  git clone <url> [diretório]
  ```
  Se _diretório_ não for informado, será criado com o nome do repositório.

- Ver status:
  ```bash
  git status
  ```

- Ver os endereços do servidor remoto: 
  ```
  git remote -v
  ```

- Adicionar o endereço remoto: 
  ```
  git remote add origin <https|ssh:@@@@@@@@@@.git>
  ```

- Remover arquivo (apenas do rastreamento do git):  
  ```
  git rm --cached file
  git rm --cached -r .  # remove todos recursivamente
  ```

- Ver diferenças realizadas (em arquivos _modified_): 
  ```
  git diff 
  ```
  Para arquivos _staged_:  
  ```
  git diff --cached|--staged
  ```

- Altera o comentário de um commit: 
  ```
  git commit --amend -m "comentário novo"
  ```

- Adiciona um arquivo _modified_ a um commit: 
  ```
  git commit --amend --no-edit
  ```
  * Adiciona o arquivo _staged_ ao commit, sem alterar o comentário
  * O --amend altera o _hash_ do commit, excluindo-o do histórico

- Restaurar arquivos modificados (_tracked_ ou _staged_): 
  ```
  git restore [--staged] file # usar --staged se já foi adicionado
  ```
  * O _restore_ precisa de um _commit_ já executado para poder voltar

- Restaurar ou buscar um arquivo de outro _branch_:
  ```
  git restore --source <branch> <file>
  ```
  Isso copiará o arquivo \<file\> de outro branch para o local atual.

- Ver histórico:
  ```
  git log [<branch>] [--oneline] [--graph] [--stat] [-n] [--all]
  ```
  * se não passar o nome da branch, mostra só da atual
  * n = número de commits  
  * stats mostra arquivos alterados

- Retornar a um commit anterior:  
  ```
  git checkout <hash_commit>  # obtido via _git log_
  ```
  * Retorna ao commit selecionado, coloca o projeto num 'detached HEAD'
  ```
  git checkout main   # retorna ao main, ou branch selecionado
  ```

- Reverter um arquivo para sua última versão conhecida do Git - _checkout_ ou _modified_ (portanto não pode ser _untracked_): 
  ```
  git checkout file
  ```

- Remover arquivos _untracked_:
  ```
  git clean
  ```

- Ver branches:
  ```bash
  git branch -a
  ```

- Criar nova branch: 
  ```
  git branch <nome>
  ```
- Entrar em um branch: 
  ```
  git checkout <branch>
  ```
  ou
  ```
  git switch <branch>
  ```

- Criar um branch e já usá-lo: 
  ```
  git checkout -b <branch>
  ```
  ou
  ```
  git switch -c <branch>
  ```
  O branch é sempre criado no estado do commit atual do projeto.

- Trocar de branch eliminando as alterações rastreadas: 
  ```
  git checkout -f <branch>
  ```

- Renomear _branch_ local: 
  ```
  git branch -m [<branch.old>] <branch.new>
  ```
  _O nome antigo só é necessário se estiver em_ __outra__ _branch_.
  Remotamente não é possível fazer, é preciso apagar e fazer novo _push_.

- Apagar um _branch_ local: 
  ```
  git branch -d <branch>
  ```
  * Usar '-D' para forçar.
  _Ao apagar um branch, todos os _commits_ são perdidos!_

- Apagar um _branch_ remoto:
  ```
  git push --delete <origin> <branch>
  ```
  _O branch local NÃO é apagado_

- Fazer _push_ de um _branch_ inexistente no servidor: 
  ```
  git checkout <branch>
  git push --set-upstream <origin> <branch>
  ```

- Fazer um merge: 
  ```
  git merge <branch>
  ```
  * \<branch\> deve ser o branch que receberá o merge.
  * O git abrirá o editor de texto padrão para comentar o merge (obrigatório).

- Verificar quais _branches_ ainda tiveram ou não tiveram _merge_:
  ```
  git branch --no-merged
  git branch --merged
  ```

- Verificar atualizações no repositório remoto sem aplicar localmente:
  ```bash
  git fetch origin
  ```

- Ver configurações:
  ```bash
  git config -l
  ```

- Alterar commit atual com autor correto (se esqueceu de configurar nome/email antes):
  ```bash
  git commit --amend --reset-author
  ```

- Ignorar tudo desde o último _commit_ (só não atinge _untracked_):  
  ```
  git reset --hard
  ```

- Altera o editor padrão do Git (que abre com alguns comandos):
  ```
  git config --global core.editor "vim"
  ```
- Cria tags:
  ```
  git tag v0.1 [<commit>]
  git tag -a -m "Versão 0.2" v0.2 [<commit>]
  ```
  * Se <commit> não é informado, a tag é criada no commit atual.

- Mostra as _tags_ do projeto: 
  ```
  git tag [-l]
  ```

- Mostra as _tags_ com descrições: 
  ```
  git tag -n
  ```

---
<!--
" }}}
-->
