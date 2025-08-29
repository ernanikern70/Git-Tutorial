<!--
" Badges ------------------ {{{
-->
<!-- Estes badges só funcionarão quando o repositório do github for público -->
![GitHub repo size](https://img.shields.io/github/repo-size/ernanikern70/Git-Tutorial?label=Repo%20size&style=flat-round&logo=github) 
![GitHub branch status](https://img.shields.io/github/checks-status/ernanikern70/Git-Tutorial/main) 
![Last commit](https://img.shields.io/github/last-commit/ernanikern70/Git-Tutorial?label=Last%20commit&style=flat-round&color=green) 
![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/ernanikern70/Git-Tutorial)
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

- Untracked: não rastreado (logo após ser criado ou modificado)

- Staged: após ser adicionado ao Git (git add file)

- Unmodified: após o commit, se não foi mais alterado (git commit -m 'xx')

- Modified: arquivo editado após o commit (se as edições forem desfeitas (git restore file), volta ao 'unmodified'; se forem mantidas e usar 'git add file', volta a 'staged')

#### Branches: 

São ramificações de projetos que permitem a aplicação de alterações ao mesmo tempo em que uma ramificação principal é mantida. 

Por exemplo, em um projeto surge a necessidade de desenvolver uma funcionalidade de cadastro de usuários; pode-se então criar a _branch_ _cad-users_ a partir da branch _main_. Caso seja necessária outra funcionalidade independente dessa última, cria-se outro _branch_ _func-extra_ também a partir do _main_. 

Neste exemplo, cada _branch_ é independente das outras, e as alterações não afetam as demais. 

No momento em que uma tarefa de um _branch_ é aprovado, ele é mesclado no _branch main_ - __merge__ -, e o _branch main_ absorve as alterações.

O arquivo também pode retornar à 'untracked caso rode 'git rm --cached file'.

Um arquivo pode estar em __mais de um estado ao mesmo tempo__. 

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
<!--
" Criação de Projeto --------------------- {{{
-->
## Criação de um projeto

Configurar de forma global (em todos os projetos) o autor e email dos projetos:  
```
git config --global user.name "Fulano de Tal"
git config --global user.email "fulano.tal@email.com"
```

Criar o primeiro projeto, localmente:  
```bash
mkdir projeto1
cd projeto1
```

Inicializar o diretório como um repositório git (cria o subdiretório .git):  
```bash
git init
```

Adicionar o endereço remoto do projeto no servidor (Github ou outro):
```
git remote add origin <url>
```
O termo _origin_ serve como alias para a url, e pode ser alterado.  

Alterar a url do projeto: 
```
git remote set-url _origin_ <url>
```

Criar e adicionar o primeiro arquivo do projeto (geralmente README.md);  
```
git add README.md (caso seja um ou poucos arquivos)
git add . (para muitos arquivos)
git commit -m 'versão 1'
git push origin main
```
** O 'commit' mais recente recebe a marcação 'HEAD' **

Por padrão, o Git cria o branch principal como _main_, isso é apenas uma nomenclatura, e pode ser alterado com: 
```
git config init.defaultBranch <branch>
```

Caso o projeto sofra alterações no servidor (esteja 'à frente' do projeto local), é preciso atualizá-lo (puxá-lo) para o projeto local: 
```
git pull <origin> <main>
```

---
---
<!--
" }}}
-->
<!--
" Rascunho --------------------- {{{
-->
<!--
## 4. Criar ou copiar arquivos do projeto

```bash
nano README.md
```

---

## 5. Adicionar os arquivos ao controle de versão

```bash
git add .
```

---

## 6. Fazer o primeiro commit

```bash
git commit -m "Primeiro commit"
```

---

## 7. Criar um repositório no GitHub (via navegador)

- Acesse: https://github.com/new
- Defina o nome e a visibilidade (público/privado)
- **Não adicione README, .gitignore ou licença** — eles já estão no projeto local

---

## 8. Conectar o repositório local ao GitHub

```bash
git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
```

---

## 9. Configurar autenticação (com token pessoal)

```bash
git config --global credential.helper store
```

Depois, salve seu token no arquivo `~/.git-credentials` assim:

```
https://SEU_USUARIO:TOKEN@github.com
```

---

## 10. Renomear a branch principal, se necessário

Se for usar `main`:
```bash
git branch -M main
```

---

## 11. Fazer o push inicial para o GitHub

```bash
git push -u origin main
```

Ou, se estiver usando `master`:
```bash
git push -u origin master
```

---

## 12. Sincronizar alterações futuras

```bash
git pull origin main  # o pull busca alterações do github ou outro gerenciador usado
```

---

## 13. Configurações do pull

```bash
CONFIGURAÇÃO		COMPORTAMENTO DO 'git pull'		HISTÓRICO	COMMIT DE MERGE?
------------		----------------------------		---------	----------------
pull.rebase false	Faz merge com os commits do remoto	Ramificado	Sim
pull.rebase true	Faz rebase dos commits locais 
					sobre o remoto		Linear		Não
pull.ff only		Só puxa se puder fazer fast-forward	Linear		Não (ou falha)
```

---
-->
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

- Ver histórico:
  ```bash
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

- Verificar quais _branches_ ainda não tiveram _merge_:
  ```
  git branch --no-merged
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

---
<!--
" }}}
-->
