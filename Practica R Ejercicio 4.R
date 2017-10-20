#filtramos los datos por mes, aeropuerto origen y descartamos los valores NAN del campo que vamos a tratar
flights_filtrado <- filter(flights, month==12 & 
                             origin=='EWR' & 
                             !is.na((dep_delay)))
#agrupamos los datos por compañía para poder mostrara acontinuación el gráfico
flights_by_carrier <-  flights_filtrado %>% group_by(carrier)

#presentamos el gráfico, fiajndo un escala que permita ver los límites del boxplot más ajustado
ggplot(flights_by_carrier, aes(x=carrier, y=dep_delay)) +
  geom_boxplot() +
  scale_y_continuous(name = "Retraso en minutos",
                     breaks = seq(-50, 950, 50),
                     limits=c(-50, 950)) +
  scale_x_discrete(name="Compañía")
```

#Si bien es cierto que la mayor parte de los retrasos en todas las compañías es inferior a los 50 minutos, se observa también gran cantidad de datos atípicos con un amplio rango de valores.

#La mediana, muy similar en todas ellas, indica que lo normal es que el retraso sea inferior a los 25 minutos.