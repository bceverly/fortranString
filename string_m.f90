!
! Fortran string class
!
! Allows for assignment from character variables and the ability to get / 
! set the internal character value.
!
module string_m
    ! Set defaults for class
    implicit none
    private

    ! Declare the type
    type, public :: string_t
        private

        ! Internal private character store
        character(:), allocatable :: str_m
    contains
        private

        ! Getter / setter functions
        procedure, public, pass(this) :: get_value => get_value_string_t
        procedure, public, pass(this) :: set_value => set_value_string_t

        ! Assignment operator for other strings and characters
        generic, public  :: assignment (=) => string_t_assign_string_t, &
                                              string_t_assign_character

        ! Procedure declaration for internal methods
        procedure, private, pass(lhs) :: string_t_assign_string_t, &
                                         string_t_assign_character
    end type string_t

    ! Class constructor
    interface string_t
        module procedure string_t_constructor
    end interface string_t

contains
    !
    ! Constructor - initialize internal storage
    !
    type (string_t) function string_t_constructor()
        string_t_constructor%str_m = ""
    end function string_t_constructor

    !
    ! Assignment - for other variables of type(string_t)
    !
    subroutine string_t_assign_string_t(lhs, rhs)
        class (string_t), intent (inout) :: lhs
        class (string_t), intent (in) :: rhs

        lhs%str_m = rhs%str_m
    end subroutine string_t_assign_string_t

    !
    ! Assignment - for characters and character arrays
    !
    elemental subroutine string_t_assign_character(lhs, rhs)
        class (string_t), intent (inout) :: lhs
        character(len=*), intent (in) :: rhs

        lhs%str_m = rhs
    end subroutine string_t_assign_character

    ! Getter method
    pure function get_value_string_t(this) result(res)
        character (:), allocatable :: res
        class (string_t), intent (in) :: this

        res = this%str_m
    end function get_value_string_t

    ! Setter method
    pure subroutine set_value_string_t(this, the_value)
        class (string_t), intent (inout) :: this
        character(len=*), intent (in) :: the_value

        this%str_m = trim(the_value)
    end subroutine set_value_string_t

end module string_m
