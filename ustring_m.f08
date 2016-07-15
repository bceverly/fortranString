module ustring_m
    use string_m
    use string_utility

    type, extends(string_t) :: UppercaseString
        private

    contains
        procedure, public, pass(this) :: set_value => set_uvalue

    end type UppercaseString

    interface assignment (=)
        module procedure UppercaseString_assign
    end interface

contains
    subroutine UppercaseString_assign(lhs, rhs)
        implicit none
        class (UppercaseString), intent (out), allocatable :: lhs
        class (UppercaseString), intent (in) :: rhs

        call lhs%set_value(rhs%string_t%get_value())
    end subroutine UppercaseString_assign

    subroutine set_uvalue(this, theValue)
        implicit none
        class (UppercaseString), intent (inout) :: this
        character(len=*), intent (in) :: theValue

        call this%string_t%set_value(StrUpCase(trim(theValue)))
    end subroutine set_uvalue

end module ustring_m
