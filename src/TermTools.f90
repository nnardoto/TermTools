module TermTools
    implicit none
    public :: TitleBox

    private
        integer, parameter :: Lenght = 70

    contains
        module subroutine TitleBox(Text)
            character(len = *) :: Text
            integer            :: Left, Right


            Left  = (Lenght - LEN(TRIM(Text)))/2
            Right = Lenght - LEN(TRIM(Text)) - Left - 2

            print*, '+' // REPEAT('-', Lenght - 2) // '+'
            print*, "|" // REPEAT(' ', Left) // Text // REPEAT(' ', Right) // "|"
            print*, '+' // REPEAT('-', Lenght - 2) // '+'
        end subroutine
        

end Module TermTools
