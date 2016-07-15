module string_m
    type String
            private
                character(:), allocatable :: str_
        contains
            private
                procedure, public, pass(this) :: getValue
                procedure, public, pass(this) :: setValue
    end type String

    interface String
        module procedure String_constructor
    end interface String

    interface assignment (=)
        module procedure String_assign
    end interface

contains
    type (String) function String_constructor()
        implicit none

        String_constructor%str_ = ""
    end function String_constructor

    subroutine String_assign(lhs, rhs)
        implicit none
        class (String), intent (out), allocatable :: lhs
        type (String), intent (in) :: rhs

        call lhs%setValue(rhs%getValue())
    end subroutine String_assign

    function getValue(this) result(res)
        implicit none
        character (:), allocatable :: res
        class (String), intent (in) :: this

        res = this%str_
    end function getValue

    subroutine setValue(this, theValue)
        implicit none
        class (String), intent (inout) :: this
        character(len=*), intent (in) :: theValue

        this%str_ = trim(theValue)
    end subroutine setValue

end module string_m
