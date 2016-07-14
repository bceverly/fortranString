!
! Main program - exercises String class created
!                in Fortran 2008
!

program fortranString
    ! Pulls in public interface for our String module
    use class_string

    ! Prevent default I-N integer assumption
    implicit none

    type (String) :: test
    call test%setValue("Bonjour!")
    call test%setValue("Hallo!")
    call test%setValue("Hello world!")
    print *, test%getValue()
end program fortranString
