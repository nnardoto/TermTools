program Test
    use TermTools


    real, parameter :: pi  = 312.14d0
    integer, parameter :: Num = 1012312


    call MainTitle("TermTools: Minimally Agradable Fortran Terminal", "Nathanael N. Batista", "nnardoto@gmail.com", "v0.0.1")
    
    call TitleBox("Test Program")
    call inLine("IntegerIntegerInteger", Num)
    call inLine("Real   ", pi)
    call LineBox()
    call LTextBox("An Text at Left ")
    call inLine("Something: ", 1123125, 2132310)

end program Test

