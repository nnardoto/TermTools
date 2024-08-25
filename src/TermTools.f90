module TermTools
    implicit none
    public :: TitleBox
    public :: LineBox
    public :: TextBox
    public :: MainTitle
    public :: InLine


    private
        integer, parameter :: Lenght = 80

    interface inLine                                     
        module procedure inLine_integer, inLine_real     
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
            character(len = *) :: Text
            integer            :: Left, Right

            Left  = (Lenght - LEN(TRIM(Text)))/2         
            Right =  Lenght - LEN(TRIM(Text)) - Left - 2 
            print*, "|" // REPEAT(' ', Left) // Text // REPEAT(' ', Right) // "|"
        end subroutine

        subroutine LineBox()
            print*, '+' // REPEAT('-', Lenght - 2) // '+'
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
            character(len = Lenght + 1)       :: NewLine
            character(len = Lenght)           :: NewVar
            real(8)                           :: Var
            integer                           :: Right

            write(NewVar, *) Var
            
            Right = Lenght/2 - LEN(Label)
            
            write(NewLine, *) '|    ' // Label // REPEAT(' ', Right) // '>>>', trim(NewVar) 
            NewLine(Lenght + 1:Lenght + 1) = '|'
            
            print*, ADJUSTL(NewLine)
        end subroutine
    
        subroutine inLine_integer(Label, Var)
            character(len = *), intent(in)    :: Label                                      
            character(len = Lenght + 1)       :: NewLine                                    
            character(len = Lenght)           :: NewVar                                     
            integer                           :: Var                                        
            integer                           :: Right                                      
                                                                                            
            write(NewVar, *) Var                                                            
                                                                                            
            Right = Lenght/2 - LEN(Label)                                                   
            write(NewLine, *) '|    ' // Label // REPEAT(' ', Right) // '>>>', trim(NewVar) 
            NewLine(Lenght + 1:Lenght + 1) = '|'                                            
            print*, ADJUSTL(NewLine)                                                        
        end subroutine                   
        ! ====================================================================
        ! End of Polymorphism 
        ! ====================================================================
end Module TermTools
