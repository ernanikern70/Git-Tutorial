Perfeito 👍 então vou preparar uma versão completa do README.md revisado e destacar as mudanças principais para você enxergar o que foi alterado e como.

Critérios que apliquei:

Correções de comando (ex.: git commit -am no lugar de git -a -m).

Clareza conceitual (corrigi pontos sobre estados de arquivos, merge, pull, etc.).

Padronização: sempre usar blocos bash para comandos, manter nomes de branches em itálico.

Boas práticas: preferir git switch ao git checkout para mudar de branch, mas manter checkout em casos onde ele ainda é necessário.

Atenção a riscos: adicionei avisos em trechos perigosos (--force, reset --hard).



---

Alterações principais (resumidas)

1. Estados de arquivos
Antes: dizia que um arquivo pode estar em mais de um estado ao mesmo tempo.
Agora: corrigi → um arquivo pertence a um estado por vez, mas diferentes arquivos podem estar em estados distintos simultaneamente.


2. Comando git commit -a -m
Antes: git -a -m 'comentário'
Agora: git commit -am "comentário" (forma correta).


3. Uso de switch vs checkout
Antes: sempre checkout.
Agora: switch para branches, checkout mantido apenas para commits/arquivos (documentação atual recomenda isso).


4. Merge
Antes: “merge trás o conteúdo de um branch para o branch atual”.
Agora: destaquei que sempre precisa estar no branch de destino antes de executar git merge <branch>.


5. Git pull
Antes: explicava como fetch + merge, mas faltava mencionar que pode ser configurado para rebase.
Agora: adicionei → git pull --rebase como prática comum em equipes que buscam histórico linear.


6. Reset
Corrigi uma descrição:

git reset --hard não apaga arquivos untracked (corrigi isso, eles permanecem).



7. Forçar push
Adicionei aviso de segurança: --force-with-lease é mais seguro que --force porque protege commits que você não tem localmente.




---

README revisado (pronto para substituir)

Aqui está o arquivo inteiro já revisado:

Git Tutorial (Linux)

Estados de um arquivo no Git

Um arquivo pode estar em um dos estados a seguir:

Untracked: novo arquivo, ainda não monitorado pelo Git.

Unmodified: arquivo já versionado e sem alterações desde o último commit.

Modified: arquivo alterado em relação ao último commit.

Staged: arquivo preparado para ser incluído no próximo commit.


> ⚠️ Cada arquivo pertence a um estado por vez, mas diferentes arquivos do repositório podem estar em estados distintos ao mesmo tempo.




---

Comandos essenciais

Iniciar repositório

git init

Clonar repositório existente

git clone <url>

Verificar status dos arquivos

git status

Adicionar arquivos à staging area

git add <arquivo>
git add .   # adiciona todos os arquivos

Realizar commit

git commit -m "Mensagem do commit"
# ou, para adicionar e commitar de uma vez

git commit -am "Mensagem do commit"

Configurações globais

git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"

Histórico de commits

git log


---

Branches

Criar branch

git branch nome-da-branch

Listar branches

git branch

Mudar de branch (recomendado)

git switch nome-da-branch

> Ainda é possível usar git checkout nome-da-branch, mas o comando switch é a prática recomendada para troca de branches.



Criar e mudar de branch ao mesmo tempo

git switch -c nome-da-branch


---

Merge

Unir branches

Estando no branch de destino, rode:

git merge nome-da-branch-origem

Resolver conflitos

O Git marcará os trechos conflitantes nos arquivos.

Edite manualmente.

Depois, adicione novamente (git add) e faça o commit.



---

Rebase

Aplicar commits de uma branch sobre outra

git rebase main

> Útil para manter histórico linear. Evite usar em branches já compartilhadas com outras pessoas.




---

Remote

Adicionar repositório remoto

git remote add origin <url>

Listar remotes

git remote -v

Enviar alterações

git push origin nome-da-branch

Trazer alterações

git pull origin nome-da-branch

> git pull por padrão faz fetch + merge. Muitas equipes preferem configurar:



git pull --rebase

para evitar merges desnecessários no histórico.

Atualizar referências sem integrar

git fetch


---

Reset e Restore

Desfazer alterações em um arquivo (não staged)

git restore <arquivo>

Retirar arquivo da staging area

git restore --staged <arquivo>

Resetar HEAD para commit anterior

git reset --hard <hash-do-commit>

> ⚠️ Cuidado: --hard descarta alterações locais em arquivos versionados. Arquivos untracked não são removidos.



Reset soft (mantém alterações no working directory)

git reset --soft <hash-do-commit>


---

Stash

Guardar alterações temporariamente

git stash

Listar stashes

git stash list

Restaurar último stash

git stash pop


---

Tags

Criar tag

git tag v1.0

Enviar tags para o remoto

git push origin --tags


---

Outras dicas úteis

Mostrar diferenças

git diff

Descartar mudanças locais em um arquivo

git checkout -- <arquivo>

> ⚠️ Hoje o comando recomendado para isso é git restore (mas checkout ainda funciona para compatibilidade).



Reverter commit já enviado

git revert <hash-do-commit>

Forçar envio de commits

git push --force-with-lease

> ⚠️ Prefira --force-with-lease em vez de --force, pois evita sobrescrever commits feitos por outras pessoas no remoto.




---

✅ Documento revisado com base na documentação oficial mais recente do Git (Linux).

