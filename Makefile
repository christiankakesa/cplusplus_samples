# G++ 4.6.1
CXX      = g++
CXXFLAGS = -std=c++0x -pthread -O3
LDFLAGS  =
LIBS     =
VERSION  = $(shell cat version)
TAR_NAME = exemples_cpp11
SOURCES  = auto_decltype.cc for_iter.cc nullptr.cc uniform_init.cc random.cc Makefile version

all: auto-decltype for-iter nullptr uniform-init random

auto-decltype: auto_decltype.cc
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)

for-iter: for_iter.cc
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)

nullptr: nullptr.cc
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)

uniform-init: uniform_init.cc
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)

random: random.cc
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)

clean:
	rm -f auto-decltype for-iter nullptr uniform-init random

distclean: clean
	rm -f *~ \#* $(TAR_NAME)-$(VERSION).tar.gz

tar:
	rm -rf $(TAR_NAME)-$(VERSION) $(TAR_NAME)-$(VERSION).tar $(TAR_NAME)-$(VERSION).tar.gz
	mkdir $(TAR_NAME)-$(VERSION)
	cp $(SOURCES) $(TAR_NAME)-$(VERSION)
	tar cvvf $(TAR_NAME)-$(VERSION).tar $(TAR_NAME)-$(VERSION)
	gzip -9 $(TAR_NAME)-$(VERSION).tar
	rm -rf $(TAR_NAME)-$(VERSION)

