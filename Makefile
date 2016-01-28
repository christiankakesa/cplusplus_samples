CXXFLAGS = -std=c++1y -O3 -static -Wall -Wextra -fno-omit-frame-pointer
LIBS     =
VERSION  = $(shell git describe --abbrev=0 --tags)
BUILDDIR = build
BINDIR   = $(BUILDDIR)/bin
LIBDIR   = $(BUILDDIR)/.lib
TAR_NAME = cplusplus_samples

.PHONY: make_unique auto_deduces_string_chrono deprecated_attribute binary_literals tuple_addressing_via_type return_type_deduction regex chrono_seconds chrono lambda_for_each auto_decltype for_iter nullptr uniform_init random clean distclean create_dirs targz

all: create_dirs make_unique auto_deduces_string_chrono deprecated_attribute binary_literals tuple_addressing_via_type return_type_deduction regex chrono_seconds chrono lambda_for_each auto_decltype for_iter nullptr uniform_init random

make_unique: src/make_unique.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

auto_deduces_string_chrono: src/auto_deduces_string_chrono.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

deprecated_attribute: src/deprecated_attribute.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

binary_literals: src/binary_literals.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

tuple_addressing_via_type: src/tuple_addressing_via_type.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

return_type_deduction: src/return_type_deduction.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

regex: src/regex.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

chrono_seconds: src/chrono_seconds.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

chrono: src/chrono.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

lambda_for_each: src/lambda_for-each.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

auto_decltype: src/auto_decltype.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

for_iter: src/for_iter.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

nullptr: src/nullptr.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

uniform_init: src/uniform_init.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

random: src/random.cc create_dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

clean:
	rm -f $(BINDIR)/*
	rm -f $(LIBDIR)/*

distclean: clean
	rm -f *~ \#*
	rm -rf $(BUILDDIR)

create_dirs:
	mkdir -p $(BINDIR)
	mkdir -p $(LIBDIR)

targz:
	rm -rf $(BUILDDIR)/$(TAR_NAME)-$(VERSION) $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar.gz
	mkdir -p $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
	cp -r src Makefile README $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
	cd $(BUILDDIR) && tar cvf $(TAR_NAME)-$(VERSION).tar $(TAR_NAME)-$(VERSION)
	gzip -9 $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar
	rm -rf $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
