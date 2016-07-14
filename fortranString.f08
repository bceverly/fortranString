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
    print *, "Hello world!"
end program fortranString
