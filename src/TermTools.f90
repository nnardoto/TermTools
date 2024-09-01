module TermTools
    implicit none
    public :: TitleBox
    public :: LineBox
    public :: TextBox
    public :: LTextBox
    public :: MainTitle
    public :: InLine


    private
        character(len = *), parameter :: FMT1 = "(A, I5, A, I5, A)"
        character(len = *), parameter :: FMT2 = "(A, I5, A)"

        integer, parameter :: Lenght = 100

    interface inLine                                     
        module procedure inLine_integer, inLine_integer_of, inLine_real     
    end interface inLine                                 

    contains
        ! ====================================================================
        ! Procedures to write things on terminal
        ! ====================================================================
        subroutine TitleBox(Text)
            character(len = *) :: Text
          
            call LineBox()
            call TextBox(Text)
            call LineBox()
        end subroutine

        subroutine TextBox(Text)
            character(len = *)      :: Text
            integer                 :: Left, Right
            character(len = 50)     :: style

            Left  = (Lenght - LEN(TRIM(Text)))/2         
            Right =  Lenght - LEN(TRIM(Text)) - Left - 2 
           
            write(style, FMT1) "(x, '|', ", Left ,"x, A, ", Right, "x, '|')"
            print style, Text
        end subroutine

        subroutine LTextBox(Text)
            character(len = *) :: Text
            character(len = 50) :: style
            integer Right

            ! Calculate Format
            Right = Lenght - Len(Text) - 6
            write(style, FMT2) "(1x, '|', 4x, A, ",  Right, "x, '|')"
            
            print style, Text 
        end subroutine

        subroutine LineBox()
            print"(1x, '+', A, '+')", REPEAT('-', Lenght - 2)
        end subroutine

        subroutine MainTitle(ProgramName, AuthorName, eMail, Version)
            character(len = *) :: ProgramName, AuthorName, eMail, Version

            call LineBox()
            call TextBox(ProgramName)
            call TextBox(Version)
            call TextBox("")
            call TextBox(AuthorName)
            call TextBox(eMail)
            call LineBox()
        end subroutine

        ! ====================================================================
        ! Polymorphism of inLine Procedure
        ! ====================================================================
        subroutine inLine_real(Label, Var)
            character(len = *), intent(in)    :: Label
            character(len = 35)               :: NewLabel
            real(4), intent(in)               :: Var

            NewLabel = ADJUSTL(Label)                         
            print "(1x, '|', 4x, A35, 5x,'::', 4x, F10.8, 38x, '|')", NewLabel, Var 
        end subroutine

        subroutine inLine_double(Label, Var)
            character(len = *), intent(in)    :: Label
            character(len = 35)               :: NewLabel
            real(8), intent(in)               :: Var

            NewLabel = ADJUSTL(Label)                         
            print "(1x, '|', 4x, A35, 5x,'::', 4x, F10.8, 38x, '|')", NewLabel, Var 
        end subroutine

        subroutine inLine_integer(Label, Var)
            character(len = *), intent(in)    :: Label                                      
            character(len = 35)               :: NewLabel
            integer                           :: Var
            
            NewLabel = ADJUSTL(Label)                         
            print "(1x, '|', 4x, A35, 5x,'::', 4x, I10, 38x, '|')", NewLabel, Var 
        end subroutine 

        subroutine inLine_integer_of(Label, Var, Var2)
            character(len = *), intent(in)    :: Label                                      
            character(len = 35)               :: NewLabel
            integer                           :: Var, Var2
            
            NewLabel = ADJUSTL(Label)                         
            print "(1x, '|', 4x, A35, 5x,'::', 4x, I10, 10x, 'of', I10, 16x, '|')", NewLabel, Var, Var2 
        end subroutine
        ! ====================================================================
        ! End of Polymorphism 
        ! ====================================================================
end Module TermTools
