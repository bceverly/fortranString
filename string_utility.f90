module string_utility
    implicit none

    private
    public :: ucase
    public :: lcase

    character (len=*), private, parameter :: LOWER_CASE = 'abcdefghijklmnopqrstuvwxyz'
    character (len=*), private, parameter :: UPPER_CASE = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

contains
    pure function ucase(Input_String) result(Output_String)
        character (len=*), intent (in) :: Input_String
        character (len(Input_String)) :: Output_String

        integer :: i,n

        Output_String = Input_String

        do i=1, len(Output_String)
            n = index(LOWER_CASE, Output_String(i:i))
            if (n /= 0) Output_String(i:i) = UPPER_CASE(n:n)
        end do
    end function ucase

    pure function lcase(Input_String) result(Output_String)
        character (len=*), intent (in) :: Input_String
        character (len(Input_String)) :: Output_String

        integer :: i,n

        Output_String = Input_String

        do i=1, len(Output_String)
            n = index(UPPER_CASE, Output_String(i:i))
            if (n /= 0) Output_String(i:i) = LOWER_CASE(n:n)
        end do
    end function lcase
end module string_utility
