# G++ 4.7

CXX      = g++
CXXFLAGS = -std=c++0x -pthread
LDFLAGS  =
LIBS     =
VERSION  = $(shell cat version)
BUILDDIR = build
BINDIR   = $(BUILDDIR)/bin
TAR_NAME = exemples_cpp11
SOURCES  = regex.cc chrono_seconds.cc chrono.cc lambda_for-each.cc auto_decltype.cc for_iter.cc nullptr.cc uniform_init.cc random.cc Makefile version

all: create-dirs regex chrono_seconds chrono lambda-for-each auto-decltype for-iter nullptr uniform-init random

regex: regex.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

chrono_seconds: chrono_seconds.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

chrono: chrono.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

lambda-for-each: lambda_for-each.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

auto-decltype: auto_decltype.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

for-iter: for_iter.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

nullptr: nullptr.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

uniform-init: uniform_init.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

random: random.cc create-dirs
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/$@ $< $(LIBS)

clean:
	rm -f $(BINDIR)/*

distclean: clean
	rm -f *~ \#*
	rm -rf $(BUILDDIR)

create-dirs:
	mkdir -p $(BINDIR)

tar:
	rm -rf $(BUILDDIR)/$(TAR_NAME)-$(VERSION) $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar.gz
	mkdir -p $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
	cp $(SOURCES) $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
	tar cvvf $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
	gzip -9 $(BUILDDIR)/$(TAR_NAME)-$(VERSION).tar
	rm -rf $(BUILDDIR)/$(TAR_NAME)-$(VERSION)
