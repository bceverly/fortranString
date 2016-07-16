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

    !
    ! Run tests
    !

    ! Test assignment from character
    string1 = "Bonjour"
    print *, string1%get_value()

    ! Test assignment from one string_t to another
    string2 = "Hello world!"
    string1 = string2
    print *, string1%get_value()

    ! Test the uppercase subclass assign from chracter
    string3 = "Howdy!"
    print *, string3%get_value()

    ! Test assigning a string_t to a ustring_t (should uppercase)
    string3 = string2
    print *, string3%get_value()
end program fortranString
