program Test
    use TermTools


    real(8), parameter :: pi  = 3.14d0
    integer, parameter :: Num = 1012312


    call MainTitle("TermTools: Minimally Agradable Fortran Terminal", "Nathanael N. Batista", "nnardoto@gmail.com", "v0.0.1")
    
    call TitleBox("Test Program")
    call inLine("IntegerIntegerInteger", Num)
    call inLine("Real   ", pi)
    call LineBox()


end program Test

