module ustring_m
    use string_m, only : string_t
    use string_utility

    implicit none
    private

    type, public, extends(string_t) :: ustring_t
        private

    contains
        procedure, public, pass(this) :: set_value => set_uvalue

        generic :: assignment (=) => ustring_t_assign_string_t, &
                          ustring_t_assign_character

        procedure, private, pass(lhs) :: ustring_t_assign_string_t
        procedure, private, pass(lhs) :: ustring_t_assign_character
    end type ustring_t

contains
    subroutine ustring_t_assign_string_t(lhs, rhs)
        class (ustring_t), intent (inout) :: lhs
        type (string_t), intent (in) :: rhs

        lhs = StrUpCase(rhs%get_value())
    end subroutine ustring_t_assign_string_t

    subroutine ustring_t_assign_character(lhs, rhs)
        class (ustring_t), intent (inout) :: lhs
        character(len=*), intent(in) :: rhs

        lhs = StrUpCase(rhs)
    end subroutine ustring_t_assign_character

    subroutine set_uvalue(this, the_value)
        class (ustring_t), intent (inout) :: this
        character(len=*), intent (in) :: the_value

        call this%string_t%set_value(StrUpCase(trim(the_value)))
    end subroutine set_uvalue

end module ustring_m
