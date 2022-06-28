.PHONY: version doctor

PANA_SCRIPT=../../tool/verify_pub_score.sh 100

DART_PATH= packages/tinkoff_acquiring
FLUTTER_PATH= packages/tinkoff_acquiring_flutter
EXAMPLE_PATH= example

FVM = fvm
FVM_FLUTTER = $(FVM) flutter
FVM_DART = $(FVM) dart

init:
	$(FVM) use 3.0.1 --force; $(FVM_DART) pub global activate pana;

version:
	$(FVM_FLUTTER) --version; $(FVM_DART) --version;

doctor:
	$(FVM_FLUTTER) doctor;

ifeq (bump, $(firstword $(MAKECMDGOALS)))
  runargs := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  $(eval $(runargs):;@true)
endif
bump:
	./tool/bump-version.sh $(filter-out $@,$(MAKECMDGOALS))

pub_get: pub_get_dart pub_get_flutter pub_get_example

pub_get_dart: 
	cd $(DART_PATH); $(FVM_FLUTTER) packages get;

pub_get_flutter: 
	cd $(FLUTTER_PATH); $(FVM_FLUTTER) packages get;

pub_get_example: 
	cd $(EXAMPLE_PATH); $(FVM_FLUTTER) packages get;

clean: clean_dart clean_flutter clean_example

clean_dart:
	cd $(DART_PATH); $(FVM_FLUTTER) clean;

clean_flutter:
	cd $(FLUTTER_PATH); $(FVM_FLUTTER) clean;

clean_example:
	cd $(EXAMPLE_PATH); $(FVM_FLUTTER) clean;

fix: fix_dart fix_flutter fix_example

fix_dart:
	cd $(DART_PATH); $(FVM_FLUTTER) format .;

fix_flutter:
	cd $(FLUTTER_PATH); $(FVM_FLUTTER) format .;

fix_example:
	cd $(EXAMPLE_PATH); $(FVM_FLUTTER) format .;

analyze: analyze_dart analyze_flutter analyze_example

analyze_dart:
	cd $(DART_PATH); $(FVM_FLUTTER) analyze . --fatal-infos;

analyze_flutter:
	cd $(FLUTTER_PATH); $(FVM_FLUTTER) analyze . --fatal-infos;

analyze_example:
	cd $(EXAMPLE_PATH); $(FVM_FLUTTER) analyze . --fatal-infos;

pana: pana_dart pana_flutter

pana_dart:
	cd $(DART_PATH); $(PANA_SCRIPT);

pana_flutter:
	cd $(FLUTTER_PATH); $(PANA_SCRIPT);