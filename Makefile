FORTRAN = egfortran
FCFLAGS = -g -c -ffree-form -std=f2008 -Wall

fortranString:	fortranString.o
	$(FORTRAN) -o fortranString fortranString.o string_m.o class_uppercase_string.o string_utility.o

fortranString.o:	string_m.o class_uppercase_string.o fortranString.f08
	$(FORTRAN) $(FCFLAGS) fortranString.f08

string_m.o:	string_m.f08
	$(FORTRAN) $(FCFLAGS) string_m.f08

class_uppercase_string.o:	string_m.o string_utility.o class_uppercase_string.f08
	$(FORTRAN) $(FCFLAGS) class_uppercase_string.f08

string_utility.o:	string_utility.f08
	$(FORTRAN) $(FCFLAGS) string_utility.f08

.PHONY:	clean
clean:
	-rm *.o *.mod fortranString
