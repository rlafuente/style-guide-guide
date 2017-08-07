# live
SSH_HOSTNAME = wf
SSH_DIR = ~/webapps/style_jplusplus/

SSH_PATH = $(SSH_HOSTNAME):$(SSH_DIR)
# server port for local server
SERVER_PORT = 8002

build:
	jekyll build --incremental

serve:
	jekyll serve --port $(SERVER_PORT) --watch --open-url

deploy: build
	rsync --compress --progress --recursive --update --delete _site/ $(SSH_PATH)

dry-deploy: build
	rsync --dry-run --compress --progress --recursive --update --delete _site/ $(SSH_PATH)

clean:
	rm -fr _site


