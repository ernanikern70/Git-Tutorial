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
" Criação de Projeto --------------------- {{{
-->

## Criação de um projeto

Configurar de forma global (em todos os projetos da máquina local) o autor e email dos projetos:  
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

A criação do repositório remoto pode ser feita de duas formas:  

- No [Github.com](https://github.com): 
    - 'Novo repositório'
    - Copiar a URL para configurar no repo local

- Usando a linha de comando, com [GitHub CLI](https://cli.github.com)  
    - _gh auth login_
        - Logar em _GitHub.com_
        - Logar com web browser
        - Copiar o código informado e colar no browser
    - _gh auth status_ para testar

    - _gh repo create_
        - Seguir instruções

Adicionar o endereço remoto do projeto no servidor (Github ou outro):
```
git remote add origin <url>
```
* O termo _origin_ serve como alias para a url, e pode ser alterado.  

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
<!--
" }}}
-->
