
# 🧰 Guia Rápido: Iniciar Projeto com Git e GitHub

Este guia descreve os passos recomendados para criar um projeto versionado com Git, conectado ao GitHub — ideal para projetos Ansible ou qualquer outro.

---

## 1. Criar o diretório do projeto

```bash
mkdir meu-projeto
cd meu-projeto
```

---

## 2. Inicializar o repositório Git

```bash
git init
```

---

## 3. Configurar o nome e e-mail do autor (antes do primeiro commit)

```bash
git config user.name ""  # Pode ser usuário do github ou nome completo
git config user.email "seu-email@example.com"
```

> Use `--global` se quiser que essa configuração valha para todos os repositórios na máquina:
> ```bash
> git config --global user.name "Ernani Kern"
> git config --global user.email "seu-email@example.com"
> ```

---

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

## 14. Comandos úteis

- Ver status:
  ```bash
  git status
  ```

- Ver histórico:
  ```bash
  git log --oneline --graph --all
  ```

- Ver branches:
  ```bash
  git branch -a
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

---
