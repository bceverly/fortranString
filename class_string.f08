module class_string
    type String
            private
                integer :: i_ = 0
        contains
            private
    end type String

    interface String
        module procedure String_constructor
    end interface String

contains
    type (String) function String_constructor()
        implicit none

        String_constructor%i_ = 42
    end function String_constructor

end module class_string
