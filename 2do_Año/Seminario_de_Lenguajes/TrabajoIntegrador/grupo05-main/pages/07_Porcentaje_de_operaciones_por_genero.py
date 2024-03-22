import streamlit as st
import matplotlib.pyplot as plt
import estadisticas_streamlit as ini

# obtiene los logs y el dataframe de los perfiles
data = ini.get_data()[0]
df_perfiles = ini.get_profile_df()

# filtra las filas correspondientes a las operaciones de clasificación o modificación
operaciones_interes = ['Clasifico una nueva imagen', 'Modifico una imagen previamente clasificada']
filas_operaciones = data[data['operation'].isin(operaciones_interes)]

# obtiene los nicks de las personas que realizaron las operaciones
nicks_operaciones = filas_operaciones['nick'].unique().tolist()

# filtra los perfiles correspondientes a los nicks de las operaciones
perfiles_operaciones = df_perfiles[df_perfiles['nick'].isin(nicks_operaciones)]

# obtiene el género de las personas que realizaron las operaciones
genero_operaciones = perfiles_operaciones['gender'].value_counts() 

# calcula los porcentajes de género
porcentajes = genero_operaciones / genero_operaciones.sum() * 100 

# crea el grafico de tortas con los porcentajes
fig, ax = plt.subplots()
ax.pie(porcentajes, labels=porcentajes.index, autopct='%1.1f%%', startangle=90)
ax.set_title('Porcentaje de género de las personas que realizaron las operaciones')

# crea un encabezado y muestra la figura en streamlit
st.subheader("Gráfico de torta con los porcentajes según género de las personas que realizaron las operaciones:")
st.pyplot(fig)