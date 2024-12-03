import sys
import os
from math import *

def ilosc_punktow_w_kole(r):
    tablica = []
    ilosc = 0
    for x in range(ceil(-r), ceil(r + 1)):
        for y in range(ceil(-r), ceil(r + 1)):
            if x * x + y * y <= r * r:
                tablica.append(" (" + str(x) + "," + str(y) + ")")
                ilosc = ilosc + 1
    return "Liczba punktów: " + str(ilosc) + "".join(str(tablica))+"\n"


odczyt = open(sys.argv[1], "r")
zapis = open(sys.argv[2], "w")

for i in odczyt:
    zapis.write(ilosc_punktow_w_kole(float(i.rstrip())))
odczyt.close()
zapis.close()



