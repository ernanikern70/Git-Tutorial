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
" }}}
-->
<!--
" Introdução --------------------- {{{
-->
# Guia Rápido: Projeto com Git e GitHub

Este guia descreve os passos recomendados para criar um projeto versionado com Git, conectado ao GitHub — ideal para projetos Ansible ou qualquer outro.  

---
<!--
" }}}
-->
<!--
" Definições --------------------- {{{
-->
## Definições

#### Características do Github: 

O Github, além de servir como repositório de projetos e controle de versionamento, tem um funcionamento semelhante a uma rede social, é possível seguir projetos (__star__), ou criar cópias de projetos (__fork__) para poder fazer alterações sem mudar o projeto principal.  

Após fazer o __fork__ de um projeto, ele ainda pode ser atualizado conforme o projeto original, através de _git pull_ ou via Github. 

O Github permite a abertura de __Issues__ (problemas), onde os colaboradores podem informar questões a serem corrigidas. 

Nas _Issues_ criadas o dono do repositório pode adicionar _labels_ e _milestones_, semelhantemente ao _GitLab_.

#### Arquivo README.md: 

Este arquivo, que não é obrigatório, pode estar na raiz do repositório, com o objetivo de documentá-lo, bem como podem existir outros README.md em outros diretórios. 

Ele usa sistema de marcação _.md_, e um recurso interessante para ajudar a escrever o arquivo é a plataforma [Dillinger](https://dillinger.io).

#### Estados de um arquivo no Git:   

- _Untracked_: não rastreado (logo após ser criado ou modificado)

- _Staged_: após ser adicionado ao Git (git add file)

- _Unmodified_: após o commit, se não foi mais alterado (git commit -m 'xx')

- _Modified_: arquivo editado após o commit (se as edições forem desfeitas (git restore file), volta ao 'unmodified'; se forem mantidas e usar 'git add file', volta a 'staged')

O arquivo também pode retornar à 'untracked caso rode 'git rm --cached file'.

Um arquivo pode estar em __mais de um estado ao mesmo tempo__. 

#### Branches: 

São ramificações de projetos que permitem a aplicação de alterações ao mesmo tempo em que uma ramificação principal é mantida. 

Por exemplo, em um projeto surge a necessidade de desenvolver uma funcionalidade de cadastro de usuários; pode-se então criar a _branch_ _cad-users_ a partir da branch _main_. Caso seja necessária outra funcionalidade independente dessa última, cria-se outro _branch_ _func-extra_ também a partir do _main_. 

Neste exemplo, cada _branch_ é independente das outras, e as alterações não afetam as demais. 

No momento em que uma tarefa de um _branch_ é aprovado, ele é mesclado no _branch main_ - __merge__ -, e o _branch main_ absorve as alterações.

#### DETACHED HEAD: 

Em situações em que usamos _git checkout <commit_hash>_, para ver o estado do projeto naquele ponto, o Git nos move da branch atual para aquele commit específico. Nessa situação, não estaremos dentro de um branch, mas em um _limbo_ dentro do projeto - o _DETACHED HEAD_. 

Ele tem esse nome, pois, como o _commit_ mais recente recebe a marcação _HEAD_, neste caso o _HEAD_ fica separado ou 'destacado' de um branch. 

No DETACHED HEAD, existem duas possibilidades: 

- Não são feitas alterações, ou, se feitas, são descartadas, apenas usando ```git switch <branch>```, mesmo se já houve _commit_; 

- Caso se queira salvar alterações, é preciso criar outro branch, após já estar no _detached head_:

    - Fazer as alterações;
    - Criar um novo branch: ```git switch -c <branch-head>```
    - ```git add <files> | git commit -m 'xx'```  
    Agora, as alterações estão salvas no branch _branch-head_.
    - ```git push [--set-upstream] <origin> <branch-head>```

#### Merge: 

O __merge__ é um dos principais comandos do _git_, que faz a 'união' entre um _branch_ aprovado em outro branch, que pode ser ou não o _main_. 

O _merge_ sempre 'trás' o conteúdo de um _branch_ para o branch atual, ou seja, é preciso rodar o comando no _branch_ onde se quer atualizar.  

A realização do _merge_ não faz o _push_ para o servidor. 

##### Passo a passo para execução de merge: 

Partindo do branch _main_, com _commit_ executado:

- Fazer alterações (criar diretório, criar arquivo, alterar arquivo):
- Criar novo _branch_, caso necessário: 
  ```
  git switch -c teste-rede
  ```
- Verificar as alterações 
- Caso positivo, fazer commit:
  ```
  git commit -m "ambiente de teste de rede"
  ```
- Voltar ao branch que receberá o _merge_:
  ```
  git switch -
  git merge teste-rede
  ```
  * Antes de fazer o merge, o git abrirá o editor de texto para comentar, se não for comentado, _não será feito o merge_.

A realização do _merge_ não faz o _push_ para o servidor.

##### Conflitos no merge: 

Podem ocorrer conflitos entre branches ao fazer um merge, p. ex., se um arquivo possui edições distintas num mesmo trecho. 

Ao tentar fazer o merge, o git mostrará a mensagem de erro e o arquivo mostrará linhas como as abaixo: 
```
Badges ------------------ 
<<<<<<< HEAD
linha 4: ernani     # status no 'main'
=======
linha 4: rodrigo    # status no 'devel-teste'
>>>>>>> devel-teste
```

As opção de solução são: 

- Desistir do merge: 
```
git merge --abort  # ou
git reset --hard
```

- Caso o conflito seja em poucas linhas de um arquivo, pode-se editá-lo diretamente o manter apenas o conteúdo desejado, eliminando as linhas com '<<<<<<<', '>>>>>' e '======='. 
  * Após, é preciso rodar novamente ```git add .``` e ```git commit -m ''```

  - Caso haja mais conflitos num arquivo, pode-se usar as ferramentas disponíveis para gerenciar conflitos em merge: 
    - Meld: 
    ```
    git config --global merge.tool meld
    git mergetool
    ```

    - Vimdiff: app do Linux

    - Fugitive.vim: plugin do Git para Vim

#### Pull Request (PR):

O _pull request_ é uma solicitação de alteração num projeto, p. ex., de alterações feitas num _fork_, para o projeto original. Pode-se enviar vários _commits_ num _pull request_.  

Caso aceita, o responsável pelo projeto original executa um _merge pull request_ via Github. 

#### Segurança no Github: 

A plataforma permite autenticação via usuário e senha, ou via SSH, esta última sendo mais recomendada. Para usá-la, é preciso adicionar uma chave pública no Github:  

- No Github - code - SSH - 'add a new public key', _ou_
    - Ícone do usuário - settings - SSH and GPG keys

- No PC, criar as chaves pública e privada: 
    ```
    ssh-keygen
    ```
    O comando irá pedir nome e localização do arquivo, pode-se deixar o default, e passphrase, pode-se deixar em branco. 

- Copiar todo o conteúdo da chave .pub e colar no Github, incluindo um título qualquer

- Adicionar a chave privada ao SSH no PC:
  ```
  ssh-add ~/.ssh/<chave>
  ```

Após fazer essa alteração, a _url_ do repositório deve ser alterada para:  

_git@github.com:\<user\>/\<repo.git\>_

---
<!--
" }}}  
-->
