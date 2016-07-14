!
! Main program - exercises String class created
!                in Fortran 2008
!

program fortranString
    ! Pulls in public interface for our String module
    use class_string

    ! Prevent default I-N integer assumption
    implicit none

    ! Declar local variables
    type (String) :: string1
    type (String) :: string2

    ! Run tests
    call string1%setValue("Bonjour!")
    call string1%setValue("Hallo!")
    call string2%setValue("Hello world!")
    string1 = string2

    print *, string1%getValue()
end program fortranString
