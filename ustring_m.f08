module ustring_m
    use string_m
    use string_utility

    type, extends(String) :: UppercaseString
        private

    contains
        procedure, public, pass(this) :: setValue => setUppercaseValue

    end type UppercaseString

    interface assignment (=)
        module procedure UppercaseString_assign
    end interface

contains
    subroutine UppercaseString_assign(lhs, rhs)
        implicit none
        class (UppercaseString), intent (out), allocatable :: lhs
        class (UppercaseString), intent (in) :: rhs

        call lhs%setValue(rhs%String%getValue())
    end subroutine UppercaseString_assign

    subroutine setUppercaseValue(this, theValue)
        implicit none
        class (UppercaseString), intent (inout) :: this
        character(len=*), intent (in) :: theValue

        call this%String%setValue(StrUpCase(trim(theValue)))
    end subroutine setUppercaseValue

end module ustring_m
