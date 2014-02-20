STCIrradiance()
{
(result=(Irradiance*CFref)/(CFref+TCref(Tref-25)))
return result
}
STCPm()
{
(result=Pm/STCIrradiance*100+p(25-Tm-2.5))
return result
}
STCVoc()
{
(result=Voc+v1(25-Tm-2.5))
return result
}

