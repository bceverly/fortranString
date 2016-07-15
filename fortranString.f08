!
! Main program - exercises String class created
!                in Fortran 2008
!

program fortranString
    ! Pulls in public interface for our String module
    use string_m, only : string_t
    use ustring_m, only : ustring_t

    ! Prevent default I-N integer assumption
    implicit none

    ! Declare local variables
    type (string_t) :: string1
    type (string_t) :: string2
    type (ustring_t) :: string3
    character (:), allocatable :: char_var
    
    char_var = "Bonjour"

    ! Run tests
    string1 = char_var
    call string1%set_value("Bonjour!")
    call string1%set_value("Hallo!")

    call string2%set_value("Hello world!")
    string1 = string2
    print *, string1%get_value()

    call string3%set_value(string1%get_value())
    print *, string3%get_value()
end program fortranString
