# Define targets
all: install

install:
	bash ./scripts/1_install.sh

cluster:
	bash ./scripts/2_cluster.sh

delclu:
	bash ./scripts/3_delete_cluster.sh

app:
	bash ./scripts/4_apply_app.sh

delapp:
	bash ./scripts/5_delete_app.sh

getpass:
	bash ./scripts/6_get_pass.sh

curl:
	bash ./scripts/7_request_http.sh

.PHONY: all install cluster delclu app delapp getpass curl