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

    ! Run tests
    string1 = "Bonjour"
    print *, string1%get_value()

    string2 = "Hello world!"
    print *, string2%get_value()

    string1 = string2
    print *, string1%get_value()

    string3 = string1%get_value()
    print *, string3%get_value()
end program fortranString
