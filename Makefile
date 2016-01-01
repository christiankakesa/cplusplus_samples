CXX = g++
CXXFLAGS = -std=c++1y -O2 -static -Wall -Wextra -fno-omit-frame-pointer
LIBS     =
VERSION  = $(shell git describe --abbrev=0 --tags)
BUILDDIR = build
BINDIR   = $(BUILDDIR)/bin
TAR_NAME = cplusplus_samples

all: create-dirs regex chrono_seconds chrono lambda-for-each auto-decltype for-iter nullptr uniform-init random

regex: src/regex.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

chrono_seconds: src/chrono_seconds.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

chrono: src/chrono.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

lambda-for-each: src/lambda_for-each.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

auto-decltype: src/auto_decltype.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

for-iter: src/for_iter.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

nullptr: src/nullptr.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

uniform-init: src/uniform_init.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

random: src/random.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

clean:
	rm -f $(BINDIR)/*

distclean: clean
	rm -f *~ \#*
	rm -rf $(BUILDDIR)

create-dirs:
	mkdir -p $(BINDIR)

targz:
	rm -rf $(BUILDDIR)/$(TAR_NAME)-$(VERSION) $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar.gz
	mkdir -p $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
	cp -r src Makefile README $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
	cd $(BUILDDIR) && tar cvf $(TAR_NAME)-$(VERSION).tar $(TAR_NAME)-$(VERSION)
	gzip -9 $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar
	rm -rf $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
