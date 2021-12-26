import pandas as pd
import numpy as np
from sklearn.metrics import r2_score

dataframe = pd.read_csv("data/ElectricityByCounty.csv")
df = dataframe.drop(columns="County")
df = df.drop(columns="Sector")
df = df.drop(columns="Total Usage")
x = [2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000, 1999, 1998, 1997, 1996, 1995, 1994, 1993, 1992, 1991, 1990]
xval = np.array(x)

predicted = []

for i in range(58):
    yval = df[i:i+1].values.tolist()
    y = []
    for j in range(31):
        y.append(yval[0][j])
    actual_y = np.array(y)
    model = np.poly1d(np.polyfit(xval, actual_y, 2))
    years = []
    for j in range(10):
        value = model(j + 2021)
        years.append(value)
    predicted.append(years)

print(predicted)

def writeCsv():
    file1 = open('data/PredictedElectricity.csv', 'w')
    file1.write('"County"\t"2021"\t"2022"\t"2023"\t"2024"\t"2025\t"2026"\t"2027"\t"2028"\t"2029"\t"2030"\n')
    i = 0
    for values in predicted:
        file1.write(dataframe.iat[i, 0] + "\t")
        for electric in values:
            file1.write(str(electric) + "\t")
        file1.write("\n")
        i += 1

writeCsv()