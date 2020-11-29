.PHONY: test

TEST_FILES?=modulus nvidia/compile nvidia/install wireguard/compile wireguard/install
SHELLCHECK_IMAGE?=koalaman/shellcheck

test:
	@docker run \
	    --rm \
	    -u $$(id -u):$$(id -g) \
	    -v $$(pwd):/src/$(PROJECT) \
	    -w /src/$(PROJECT) \
	    $(SHELLCHECK_IMAGE) \
	    $(TEST_FILES)

build:
	docker build -t dippynark/modulus:v1.0.0 .

push: build
	docker push dippynark/modulus:v1.0.0
