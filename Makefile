PEM := kick-emr.pem
KEYNAME := kick-emr-`id -un`

all: $(PEM)

setup:
	bundle install

$(PEM): setup
	bundle exec ruby create_key_pair.rb $(KEYNAME) > $@
	chmod 600 $@

clean:
	rm -f $(PEM)
	bundle exec ruby delete_key_pair.rb $(KEYNAME)

.PHONY: all setup clean
