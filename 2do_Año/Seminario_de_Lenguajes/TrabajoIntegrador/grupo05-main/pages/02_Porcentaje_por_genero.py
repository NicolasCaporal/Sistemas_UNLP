import streamlit as st
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import estadisticas_streamlit as ini

# obtiene el dataframe de los perfiles
df_perfiles = ini.get_profile_df()

# calcula los porcentajes de uso de la aplicación por género
porcentaje_genero = df_perfiles['gender'].value_counts(normalize=True) * 100 

# crea un grafico de barras
fig, ax = plt.subplots()
ax.bar(porcentaje_genero.index, porcentaje_genero.values)
ax.set_xlabel('Género')
ax.set_ylabel('Porcentaje')
ax.set_title('Uso por género')

# establece el máximo del eje y en 100
ax.set_ylim([0, 100]) 

# ajusta las marcas del eje y en incrementos de 10
ax.yaxis.set_major_locator(ticker.MultipleLocator(10)) 

# crea un encabezado y muestra la figura en streamlit
st.subheader("Gráfico que muestra el porcentaje de uso de la aplicación por género")
st.pyplot(fig)