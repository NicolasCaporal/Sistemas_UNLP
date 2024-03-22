import streamlit as st
import matplotlib.pyplot as plt
import estadisticas_streamlit as ini

# lee los datos del log
data = ini.get_data()[0]

# funcion que acorta 2 campos de operaciones 
def acortar_logs(string):
    if string == 'Cambio en la configuracion del sistema':
        return 'Cambio en la config'
    elif string == 'Modifico una imagen previamente clasificada':
        return 'Modifico una imagen'
    else:
        return string
# modifica directamente la columna 'operation' en el DataFrame 'data'
data['operation'] = data['operation'].apply(acortar_logs)

# agrupar los datos por nick y operación, y contar las ocurrencias
operaciones_por_nick = data.groupby(['nick', 'operation']).size().unstack(fill_value=0)

# crea el gráfico apilado de barras con ejes invertidos
fig, ax = plt.subplots()
operaciones_por_nick.plot(kind='barh', stacked=True, ax=ax)
ax.set_xlabel('Cantidad')
ax.set_ylabel('Nick')
ax.set_title('Cantidades de Operaciones por Nick')

# crea un encabezado y muestra la figura en streamlit
st.subheader("Gráfico de barras apilado que muestra las cantidades de operaciones por nick")
st.pyplot(fig)