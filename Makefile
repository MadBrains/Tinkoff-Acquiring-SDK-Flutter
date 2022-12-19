.PHONY: version doctor

PANA_SCRIPT=../../tool/verify_pub_score.sh 100

DART_PATH= packages/tinkoff_acquiring
FLUTTER_PATH= packages/tinkoff_acquiring_flutter
PACKAGES_PATH= $(DART_PATH) $(FLUTTER_PATH) example

FVM = fvm
FVM_FLUTTER = $(FVM) flutter
FVM_DART = $(FVM) dart

init:
	$(FVM) use 3.3.5 --force; $(FVM_DART) pub global activate pana;

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

build_runner:
	cd $(DART_PATH); $(FVM_FLUTTER) pub run build_runner build --delete-conflicting-outputs;

pub_get:
	$(foreach v, $(PACKAGES_PATH), cd $(v); $(FVM_FLUTTER) packages get; cd ../..;)

clean:
	$(foreach v, $(PACKAGES_PATH), cd $(v); $(FVM_FLUTTER) clean; cd ../..;)

fix:
	$(foreach v, $(PACKAGES_PATH), cd $(v); $(FVM_FLUTTER) format .; cd ../..;)

analyze:
	$(foreach v, $(PACKAGES_PATH), cd $(v); $(FVM_FLUTTER) analyze . --fatal-infos; cd ../..;)

pana: pana_dart pana_flutter

pana_dart:
	cd $(DART_PATH); $(PANA_SCRIPT);

pana_flutter:
	cd $(FLUTTER_PATH); $(PANA_SCRIPT);