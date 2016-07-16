!
! Fortran uppercase string class
!
! This is a subclass of the string_t class that automatically folds all input
! to uppercase leveraging the functions supplied in the string_utility module.
!
module ustring_m
    ! Use only the things we need from the other modules
    use string_m, only : string_t
    use string_utility, only : ucase

    ! Set up the defaults for the class
    implicit none
    private

    ! Declare the type
    type, public, extends(string_t) :: ustring_t
        ! Private by default - no member data (we use the data in the base)
        private

    contains
        ! Override the setter method from the base class and alias it
        procedure, public, pass(this) :: set_value => set_uvalue

        ! Override the string_t and character  assignment operators and
        ! alias them
        procedure, public, pass(lhs) :: string_t_assign_string_t => &
                                         ustring_t_assign_string_t
        procedure, public, pass(lhs) :: string_t_assign_character => &
                                         ustring_t_assign_character
    end type ustring_t

contains
    ! Assignment of a string_t to this class
    pure subroutine ustring_t_assign_string_t(lhs, rhs)
        class (ustring_t), intent (inout) :: lhs
        class (string_t), intent (in) :: rhs

        call lhs%set_value(rhs%get_value())
    end subroutine ustring_t_assign_string_t

    ! Assignment of a character or character array to this class
    elemental subroutine ustring_t_assign_character(lhs, rhs)
        class (ustring_t), intent (inout) :: lhs
        character(len=*), intent(in) :: rhs

        call lhs%set_value(rhs)
    end subroutine ustring_t_assign_character

    ! Value setting method that folds to uppercase
    pure subroutine set_uvalue(this, the_value)
        class (ustring_t), intent (inout) :: this
        character(len=*), intent (in) :: the_value

        call this%string_t%set_value(ucase(trim(the_value)))
    end subroutine set_uvalue

end module ustring_m
