SHELL:= /bin/bash

all: install

test:
	@echo "Enter a value for the variable1:"; \
	read -p "" variable1; \
	echo "Enter a value for the variable2:"; \
	read -p "" variable2; \
	bash ./scripts/0_test.sh "$$variable1" "$$variable2";

install:
	bash ./scripts/1_install.sh

addgitlab:
	bash ./scripts/2_add_to_cluster.sh

ingress:
	bash ./scripts/3_gitlab_ingress.sh

delgitlab:
	bash ./scripts/4_del_from_cluster.sh

getgitlabpods:
	bash ./scripts/5_get_gitlab_pods.sh

getpass:
	bash ../p3/scripts/6_get_pass.sh

getrootpass:
	bash ./scripts/6_get_rootpass.sh

createuser:
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le mot de passe du compte:"; \
	read -sp "" password; \
	echo "entrez le nom propre de l'utilisateur du compte:"; \
	read -p "" name; \
	echo "entrez l'email du compte:"; \
	read -p "" email; \
	bash ./scripts/7_create_user.sh "$$username" "$$password" "$$name" "$$email"

addusertoken: delusertoken
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le mot de passe du compte:"; \
	read -sp "" password; \
	echo "entrez les scopes du token:"; \
	read -p "" scopes; \
	bash ./scripts/8_add_user_token.sh "$$username" "$$password" "$$scopes"

rotusertoken:
	bash ./scripts/9_rotate_user_token.sh

delusertoken:
	bash ./scripts/10_del_user_token.sh

addssh:
	bash ./scripts/11_add_ssh.sh

createrepo:
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le reponame:"; \
	read -p "" reponame; \
	bash ./scripts/12_git_create_repo.sh "$$reponame" "$$path"

clonerepo:
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le mot de passe du compte:"; \
	read -sp "" password; \
	echo "entrez le nom du dépos à cloner:"; \
	read -p "" reponame; \
	bash ./scripts/13_git_clone.sh "$$username" "$$password" "$$reponame"

addbonus:
	@echo "entrez la ou des cible(s) à copier:"; \
	read -p "" target; \
	echo "entrez le nom du depos de destination"; \
	read -p "" reponame; \
	echo "entrez le chemin le dossier de copier:"; \
	read -p "$$reponame/" destination; \
	bash ./scripts/14_add_bonus.sh "$$target" "$$reponame" "$$destination"

pushbonus:
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le mot de passe du compte:"; \
	read -sp "" password; \
	echo "entrez le nom propre de l'utilisateur qui push:"; \
	read -p "" name; \
	echo "entrez l'email de l'utilisateur qui push:"; \
	read -p "" email; \
	echo "entrez le nom du dépôt à push:"; \
	read -p "" reponame; \
	echo "entrez le commentaire de votre commit:"; \
	read -p "" commit; \
	bash ./scripts/15_push_bonus.sh "$$username" "$$password" "$$name" "$$email" "$$reponame" "$$commit"

delapp:
	bash ./scripts/16_delete_app.sh

appbonus:
	@echo "entrez le nom d'utilisateur du compte où se trouve le dépos cible:"; \
	read -p "" username; \
	echo "entrez le nom du dépôt ciblé:"; \
	read -p "" reponame; \
	echo "entrez le chemin du dossier contenant le fichier de configuration.yaml de l'application à déployé depuis gitlab par argocd :"; \
	read -p ">>$$reponame/" path; \
	bash ./scripts/17_apply_bonus.sh "$$username" "$$reponame" "$$path"

delbonus:
	bash ./scripts/18_delete_bonus.sh

.PHONY: all install addgitlab ingress delgitlab getgitlabpods getpass getrootpass changepass createuser addusertoken rotusertoken delusertoken addssh createrepo clonerepo addbonus pushbonus delbonus appbonus delbonus