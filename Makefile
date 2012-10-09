# G++ 4.6.3
CXX      = g++
CXXFLAGS = -std=c++0x -pthread -O3
LDFLAGS  =
LIBS     =
VERSION  = $(shell cat version)
BUILDDIR = build
BINDIR   = $(BUILDDIR)/bin
TAR_NAME = exemples_cpp11
SOURCES  = lambda_for-each.cc auto_decltype.cc for_iter.cc nullptr.cc uniform_init.cc random.cc Makefile version

all: create-dirs lambda-for-each auto-decltype for-iter nullptr uniform-init random

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
