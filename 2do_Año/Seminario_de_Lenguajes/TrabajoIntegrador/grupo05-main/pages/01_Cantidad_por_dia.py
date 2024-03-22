import pandas as pd
import streamlit as st
import calendar 
import matplotlib.pyplot as plt
import estadisticas_streamlit as ini

# lee los logs
data = ini.get_data()[0]
# convierte la columna de timestamp a formato de fecha y hora
data['timestamp'] = pd.to_datetime(data['Timestamp'], unit='s') 
# obtiene el día de la semana correspondiente a cada operación
data['day_of_week'] = data['timestamp'].dt.dayofweek 
# obtiene el nombre del día de la semana
data['day_name'] = data['day_of_week'].apply(lambda x: calendar.day_name[x]) 
# cant operaciones por día de la semana
operations_count = data['day_name'].value_counts() 

# verifica y reemplaza los días de la semana faltantes
days_of_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
operations_count = operations_count.reindex(days_of_week, fill_value=0)

# crea el grafico de barras
fig, ax = plt.subplots()
ax.bar(operations_count.index, operations_count.values)
ax.set_xlabel('Día de la semana')
ax.set_ylabel('Cantidad')
ax.set_title('Operaciones')

# modifica los valores del eje x
ax.set_xticklabels(['L', 'M', 'M', 'J', 'V', 'S', 'D']) 

# crea un encabezado y muestra la figura en streamlit
st.subheader("Gráfico que compara los días de la semana en que se realizaron operaciones usando la aplicación")
st.pyplot(fig)