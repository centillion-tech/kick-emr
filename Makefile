PEM := kick-emr.pem
KEYNAME := kick-emr-`id -un`

all: $(PEM)

setup: setup.stamp
setup.stamp:
	bundle install
	touch $@

$(PEM): setup.stamp
	bundle exec ruby create_key_pair.rb $(KEYNAME) > $@
	chmod 600 $@

clean:
	rm -f $(PEM) setup.stamp
	bundle exec ruby delete_key_pair.rb $(KEYNAME)

.PHONY: all setup clean
