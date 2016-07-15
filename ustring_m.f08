module ustring_m
    use string_m, only : string_t
    use string_utility
    implicit none

    type, extends(string_t) :: ustring_t
        private

    contains
        procedure, public, pass(this) :: set_value => set_uvalue

    end type ustring_t

    interface assignment (=)
        module procedure ustring_assign
    end interface

contains
    subroutine ustring_assign(lhs, rhs)
        class (ustring_t), intent (out), allocatable :: lhs
        class (ustring_t), intent (in) :: rhs

        call lhs%set_value(rhs%string_t%get_value())
    end subroutine ustring_assign

    subroutine set_uvalue(this, the_value)
        class (ustring_t), intent (inout) :: this
        character(len=*), intent (in) :: the_value

        call this%string_t%set_value(StrUpCase(trim(the_value)))
    end subroutine set_uvalue

end module ustring_m
