FORTRAN = egfortran
FCFLAGS = -g -c -ffree-form -std=f2008 -Wall

fortranString:	fortranString.o
	$(FORTRAN) -o fortranString fortranString.o class_string.o class_uppercase_string.o string_utility.o

fortranString.o:	class_string.o class_uppercase_string.o fortranString.f08
	$(FORTRAN) $(FCFLAGS) fortranString.f08

class_string.o:	class_string.f08
	$(FORTRAN) $(FCFLAGS) class_string.f08

class_uppercase_string.o:	class_string.o string_utility.o class_uppercase_string.f08
	$(FORTRAN) $(FCFLAGS) class_uppercase_string.f08

string_utility.o:	string_utility.f08
	$(FORTRAN) $(FCFLAGS) string_utility.f08

.PHONY:	clean
clean:
	-rm *.o *.mod fortranString
