module string_m
    implicit none
    private

    type, public :: string_t
        private

        character(:), allocatable :: str_m
    contains
        private

        procedure, public, pass(this) :: get_value => get_value_string_t
        procedure, public, pass(this) :: set_value => set_value_string_t

        generic, public  :: assignment (=) => string_t_assign_string_t, &
                                              string_t_assign_character

        procedure, private, pass(lhs) :: string_t_assign_string_t
        procedure, private, pass(lhs) :: string_t_assign_character
    end type string_t

    interface string_t
        module procedure string_t_constructor
    end interface string_t

contains
    type (string_t) function string_t_constructor()
        string_t_constructor%str_m = ""
    end function string_t_constructor

    elemental subroutine string_t_assign_string_t(lhs, rhs)
        class (string_t), intent (inout) :: lhs
        type (string_t), intent (in) :: rhs

        lhs%str_m = rhs%str_m
    end subroutine string_t_assign_string_t

    elemental subroutine string_t_assign_character(lhs, rhs)
        class (string_t), intent (inout) :: lhs
        character(len=*), intent (in) :: rhs

        lhs%str_m = rhs
    end subroutine string_t_assign_character

    function get_value_string_t(this) result(res)
        character (:), allocatable :: res
        class (string_t), intent (in) :: this

        res = this%str_m
    end function get_value_string_t

    subroutine set_value_string_t(this, the_value)
        class (string_t), intent (inout) :: this
        character(len=*), intent (in) :: the_value

        this%str_m = trim(the_value)
    end subroutine set_value_string_t

end module string_m
