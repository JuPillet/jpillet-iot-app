SHELL:= /bin/bash

all: install

0_test:
	@echo "Enter a value for the variable1:"; \
	read -p "" variable1; \
	echo "Enter a value for the variable2:"; \
	
	@ecread -p "" variable2; \
	bash ./scripts/0_test.sh "$$variable1" "$$variable2";

1_install:
	bash ./scripts/1_install.sh

2_addgitlab:
	
	@ecbash ./scripts/2_add_to_cluster.sh

3_ingress:
	bash ./scripts/3_gitlab_ingress.sh

4_delgitlab:
	bash ./scripts/4_del_from_cluster.sh

5_getgitlabpods:
	bash ./scripts/5_get_gitlab_pods.sh

6_getpass:
	bash ../p3/scripts/6_get_pass.sh

7_getrootpass:
	bash ./scripts/6_get_rootpass.sh

8_createuser:
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le mot de passe du compte:"; \
	read -sp "" password; \
	echo "entrez le nom propre de l'utilisateur du compte:"; \
	read -p "" name; \
	echo "entrez l'email du compte:"; \
	read -p "" email; \
	bash ./scripts/7_create_user.sh "$$username" "$$password" "$$name" "$$email"

9_addusertoken: delusertoken
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le mot de passe du compte:"; \
	read -sp "" password; \
	echo "entrez les scopes du token:"; \
	read -p "" scopes; \
	bash ./scripts/8_add_user_token.sh "$$username" "$$password" "$$scopes"

10_rotusertoken:
	bash ./scripts/9_rotate_user_token.sh

11_delusertoken:
	bash ./scripts/10_del_user_token.sh

12_addssh:
	bash ./scripts/11_add_ssh.sh

13_createrepo:
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le reponame:"; \
	read -p "" reponame; \
	bash ./scripts/12_git_create_repo.sh "$$reponame" "$$path"

14_clonerepo:
	@echo "entrez le nom d'utilisateur du compte:"; \
	read -p "" username; \
	echo "entrez le mot de passe du compte:"; \
	read -sp "" password; \
	echo "entrez le nom du dépos à cloner:"; \
	read -p "" reponame; \
	bash ./scripts/13_git_clone.sh "$$username" "$$password" "$$reponame"

15_addbonus:
	@echo "entrez la ou des cible(s) à copier:"; \
	read -p "" target; \
	echo "entrez le nom du depos de destination"; \
	read -p "" reponame; \
	echo "entrez le chemin ou copier la cible:"; \
	read -p "$$reponame/" destination; \
	bash ./scripts/14_add_bonus.sh "$$target" "$$reponame" "$$destination"

16_pushbonus:
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

17_delapp:
	bash ./scripts/16_delete_app.sh

18_appbonus:
	@echo "entrez le nom d'utilisateur du compte où se trouve le dépos cible:"; \
	read -p "" username; \
	echo "entrez le nom du dépôt ciblé:"; \
	read -p "" reponame; \
	echo "entrez le chemin du dossier contenant le fichier de configuration.yaml de l'application à déployé depuis gitlab par argocd :"; \
	read -p ">>$$reponame/" path; \
	bash ./scripts/17_apply_bonus.sh "$$username" "$$reponame" "$$path"

19_delbonus:
	bash ./scripts/18_delete_bonus.sh

.PHONY: all 0_test 1_install 2_addgitlab 3_ingress 4_delgitlab 5_getgitlabpods 6_getpass 7_getrootpass 8_createuser 9_addusertoken 10_rotusertoken 11_delusertoken 12_addssh 13_createrepo 14_clonerepo 15_addbonus 16_pushbonus 17_delapp 18_appbonus 19_delbonus
