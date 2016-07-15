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
    end type string_t

    interface string_t
        module procedure string_t_constructor
    end interface string_t

    interface assignment (=)
        module procedure string_t_assign
    end interface

contains
    type (string_t) function string_t_constructor()
        string_t_constructor%str_m = ""
    end function string_t_constructor

    subroutine string_t_assign(lhs, rhs)
        class (string_t), intent (out), allocatable :: lhs
        type (string_t), intent (in) :: rhs

        call lhs%set_value(rhs%get_value())
    end subroutine string_t_assign

    function get_value_string_t(this) result(res)
        character (:), allocatable :: res
        class (string_t), intent (in) :: this

        res = this%str_m
    end function get_value_string_t

    subroutine set_value_string_t(this, theValue)
        class (string_t), intent (inout) :: this
        character(len=*), intent (in) :: theValue

        this%str_m = trim(theValue)
    end subroutine set_value_string_t

end module string_m
