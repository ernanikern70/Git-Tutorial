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
" Sumário ----------------------- {{{
-->
## Sumário

- [Introdução](#introdução)
- [Comandos Úteis](#comandos-úteis)

---
<!---
" }}}
-->
<!--
" Introdução --------------------------- {{{
-->
## Introdução 

Este guia descreve os passos recomendados para criar um projeto versionado com Git, conectado ao GitHub - ideal para projetos Ansible ou qualquer outro.

<sub>[⬆](#sumário)</sub>
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
  git remote add origin <https|ssh://github.com/user/project.git>
  ```
  * O termo _origin_ pode ser alterado conforme preferência. 

- Remover arquivos (apenas do rastreamento do git):  
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

- Alterar o comentário de um commit: 
  ```
  git commit --amend -m "comentário novo"
  ```

- Adiciona um arquivo _modified_ a um commit: 
  ```
  git commit --amend --no-edit
  ```
  * Adiciona o arquivo _staged_ ao commit, sem alterar o comentário
  * O '_--amend_' altera o _hash_ do commit, excluindo-o do histórico

- Restaurar arquivos modificados (_tracked_ ou _staged_): 
  ```
  git restore [--staged] file # usar --staged se já foi adicionado
  ```
  * O _restore_ precisa de um _commit_ já executado para poder voltar

- Restaurar ou buscar um arquivo de outro _branch_:
  ```
  git restore --source <branch> <file>
  ```
  Isso copiará o arquivo \<file\> de outro _branch_ para o local atual.

- Ver histórico:
  ```
  git log [<branch>] [--oneline] [--graph] [--stat] [-n] [--all]
  ```
  * se não passar o nome do branch, mostra só do atual - __[--all]__ mostra todos os _branches_.
  * n = número de _commits_.  
  * stats mostra arquivos alterados.

- Retornar a um _commit_ anterior:  
  ```
  git checkout <hash_commit>  # obtido via _git log_
  ```
  * Retorna ao _commit_ selecionado, coloca o projeto num '_DETACHED HEAD_'
  ```
  git switch main   # retorna ao main, ou _branch_ selecionado
  ```
  * '_checkout_' deve ser usado para _commits_ e arquivos.
  * '_switch_' deve ser usado para _branches_. 

- Reverter um arquivo para sua última versão conhecida do Git - (arquivo deve ser rastreado): 
  ```
  git restore file
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
  git switch <branch>
  ```

- Criar um _branch_ e já usá-lo: 
  ```
  git switch -c <branch>
  ```
  * O _branch_ é sempre criado no estado do commit atual do projeto.

- Trocar de _branch_ eliminando as alterações rastreadas: 
  ```
  git switch -f <branch>
  ```

- Renomear _branch_ local: 
  ```
  git branch -m [<branch.old>] <branch.new>
  ```
  * _O nome antigo só é necessário se estiver em_ __outro__ _branch_.
  Remotamente não é possível fazer, é preciso apagar e fazer novo _push_.

- Apagar um _branch_ local: 
  ```
  git branch -d <branch>
  ```
  * Usar '-D' para forçar.
  _Ao apagar um branch, todos os _commits_ são perdidos!_

- Enviar um _branch_ local ao repositório remoto: 
  ```
  git push origin <branch>
  ```

- Apagar um _branch_ remoto:
  ```
  git push --delete <origin> <branch>
  ```
  * _O branch local NÃO é apagado_

- Fazer _push_ de um _branch_ inexistente no servidor: 
  ```
  git switch <branch>
  git push [--set-upstream] <origin> <branch>
  ```

- Fazer um merge: 
  ```
  git merge <branch>
  ```
  * O comando deve ser executado no _branch_ de destino de \<branch\>.
  * O git abrirá o editor de texto padrão para comentar o _merge_ (obrigatório).

- Verificar quais _branches_ ainda tiveram ou não tiveram _merge_:
  ```
  git branch --no-merged
  git branch --merged
  ```

- Verificar atualizações no repositório remoto _sem aplicar localmente_:
  ```bash
  git fetch origin
  ```
  * As alterações ficarão no _branch_ _remote/\<branch\>_.
  
- Buscar um _branch_ específico do repositório remoto (idealmente que não exista localmente):
  ```
  git fetch origin <branch>
  ```
  * O _branch_ será listado apenas com ```git branch -a```:
  remotes/origin/\<branch\>

  Se fizer depois: ```git switch <branch>```
  O _branch_ será criado localmente. 

- Após o _fetch_, ver diferenças de _commits_ no histórico: 
  ```
  git log main..origin/main  # Mostra commits que estão no remoto mas não na sua main local.
  git log origin/main..main  # Mostra commits que estão na sua main local mas ainda não foram enviados ao remoto.
  ```

- Ver diferenças entre arquivos: 
  ```
  git diff main..origin/main
  ```
  * Mostra as mudanças de código que existem no remoto em relação à sua _branch_ local.

- Ver um resumo do estado dos _branches_: 
  ```
  git fetch origin
  git branch -vv
  ```

- Ver configurações:
  ```
  git config -l
  ```

- Executar _add_ e _commit_ em um comando (para arquivo já rastreado): 
  ```
  git -am 'comentário'
  ```

- Alterar commit atual com autor correto (se esqueceu de configurar nome/email antes):
  ```
  git commit --amend --reset-author
  ```

- Reverter um _commit_:
  ```
  git revert HEAD|<hash_commit>
  ```
  * Solicita alteração no comentário do commit.
  * Usando o 'HEAD', ele vai voltar 1 commit, o que é mais seguro para não ocorrer conflitos - _porém, ele vai ficar 'revertendo e voltando' ao mesmo commit_.  
  * Ele não apaga o commit revertido, e cria outro.

- Desfazer um _commit_ (apagar):
  ```
  git reset --hard HEAD~1
  ```
  * __Apaga__ 1 commit, volta o HEAD para o anterior. 
  * O número após 'HEAD~' indica quantos commits voltar.

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
  * Se \<commit\> não é informado, a tag é criada no commit atual.

- Mostra as _tags_ do projeto: 
  ```
  git tag [-l]
  ```

- Mostra as _tags_ com descrições: 
  ```
  git tag -n
  ```

- Enviar tags pro repositório: 
  ```
  git push origin <tag>
  ```

- Enviar todas as tags pro repositório (não recomendado):
  ```
  git push origin --tags
  ```

- Verificar diferenças entre _tags_ (entre _commits_ ou versões):
  ```
  git diff <tag1> <tag2>
  ```

- Remoção local e remota de tags: 
  ```
  git tag -d <tag>
  git push --delete origin <tag>
  ```

- Ver detalhes de um stash: 
  ```
  git stash show -p stash@{n}
  ```

- Apagar um stash: 
  ```
  git stash drop [stash@{n}]
  ```

- Limpar a lista de stashes: 
  ```
  git stash clear
  ```

- Git reset (_volta ao commit anterior e..._): 
  ```
  git reset --hard  # apaga todas as alterações locais, menos _untracked_.
  git reset --mixed # mantém as mudanças na área de trabalho como _modified_.
  git reset --soft  # mantém as mudanças na área de preparação (_staged_).
  ```

- Forçar o push de um repositório local para o remoto, quando ocorre conflito: 
  ```
  git push origin main --force
  ```
  * Atenção, só usar quando tiver certeza que o repositório local é o correto, o remoto será sobrescrito. 

- Forçar o push, mas apenas se não sobrescrever alterações no destino: 
  ```
  git push origin main --force-with-lease
  ```

- Fazer um _rebase_ interativo: 
  ```
  git rebase --interactive
  ```

- Iniciar um _git bisect_:
  ```
  git bisect start
  ```

- Encerrar o _bisect_:
  ```
  git bisect reset
  ```

- Criar _aliases_ para comandos do Git: 
  ```
  git config [--global] alias.s status
  git config [--global] alias.l log
  git config [--global] alias.line 'log --oneline'
  ```
  Os comandos ```git s```, ```git l``` e ```git line``` executarão os comandos configurados. 

- Visualizar um arquivo de outro _branch_ sem fazer _switch_:
  ```
  git show main:README.md
  ```
  
<sub>[⬆](#sumário)</sub>
---
<!--
" }}}
-->
