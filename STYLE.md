Style Guide Recommendations

This style guide comes from recommendations received on comp.lang.fortran
from various helpful people including Wolfgang Kilian.

Use of "implicit none":
--- --  -------- ----

It is recommended that this be done globally on a per file basis to avoid
having to repeat it throughout the code - making the code more readable.

Examples:

module foo
    implicit none

program foo
    implicit none

Private by default:
------- -- -------

For modules and user defined types, place private at the top of the
declaration to force private as the default for any member variables or
procedures.  To declare public, they have to be explicitly identified.

Examples:

module foo
    implicit none
    private

Module names vs. Type Names:
------ ----- --  ---- -----

Declare the name of the module to be the base name that you would like
to use, then declare the type within the module with an underscore t
suffix:

Examples:

module foo
    implicit none
    private

    public :: foo_t

    type :: foo_t

Module Names are File Names:
------ ----- --- ---- -----

Name files the same as the module.  For example, if you have a module named
'foo', the file will be named 'foo.f', or 'foo.f95', etc. 

Define Type-Bound Procedures in Submodules:
------ ---- ----- ---------- -- ----------

module foo
end module foo

submodule (foo) foo_a
end submodule foo_a

Submodules should be named with the underscore a suffix and the filename
should be the same as the submodule.
