import streamlit as st
import matplotlib.pyplot as plt
import estadisticas_streamlit as ini

# lee los logs
data = ini.get_data()[0]

# obtiene las cantidades de cada operación
cantidades_operaciones = data['operation'].value_counts()  

# verifica y reemplaza las operaciones faltantes
operations = ['Cambio en la configuracion del sistema', 'Nuevo meme', 'Nuevo collage',
                    'Modifico una imagen previamente clasificada', 'Clasifico una nueva imagen']
cantidades_operaciones = cantidades_operaciones.reindex(operations, fill_value=0)

# crea el grafico de barras
fig, ax = plt.subplots()
ax.bar(cantidades_operaciones.index, cantidades_operaciones.values)
ax.set_xlabel('Operación')
ax.set_ylabel('Cantidad')
ax.set_title('Cant X operación')

# modifica los valores del eje x
ax.set_xticklabels(['change_config', 'new_meme', 'new_collage', 'edit_image', 'new_image']) 
plt.xticks(rotation=45)

# crea un encabezado y muestra la figura en streamlit
st.subheader("Gráfico que muestra las cantidades de cada operación realizada")
st.pyplot(fig)