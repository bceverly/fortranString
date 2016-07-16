module ustring_m
    use string_m, only : string_t
    use string_utility, only : ucase, lcase

    implicit none
    private

    type, public, extends(string_t) :: ustring_t
        private

    contains
        procedure, public, pass(this) :: set_value => set_uvalue
        procedure, public, pass(lhs) :: string_t_assign_string_t => &
                                         ustring_t_assign_string_t
        procedure, public, pass(lhs) :: string_t_assign_character => &
                                         ustring_t_assign_character
    end type ustring_t

contains
    pure subroutine ustring_t_assign_string_t(lhs, rhs)
        class (ustring_t), intent (inout) :: lhs
        class (string_t), intent (in) :: rhs

        call lhs%set_value(rhs%get_value())
    end subroutine ustring_t_assign_string_t

    elemental subroutine ustring_t_assign_character(lhs, rhs)
        class (ustring_t), intent (inout) :: lhs
        character(len=*), intent(in) :: rhs

        call lhs%string_t%set_value(ucase(rhs))
    end subroutine ustring_t_assign_character

    pure subroutine set_uvalue(this, the_value)
        class (ustring_t), intent (inout) :: this
        character(len=*), intent (in) :: the_value

        call this%string_t%set_value(ucase(trim(the_value)))
    end subroutine set_uvalue

end module ustring_m
