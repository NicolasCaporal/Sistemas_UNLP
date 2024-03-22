import pandas as pd
import streamlit as st
import estadisticas_streamlit as ini

# lee los logs
data = ini.get_data()[0]

# filtra las filas correspondientes a los collages
filas_collages = data[data['operation'] == 'Nuevo collage'] 
# obtiene las imágenes usadas en los collages
textos_collages = filas_collages['values'].str.split(';').explode().str.strip() 
# obtiene el ranking de las 5 imágenes más usadas para collages
ranking_collages = textos_collages.value_counts().head(5) 
# lo convierte en un DataFrame
df_ranking_collages = pd.DataFrame({'Imagen': ranking_collages.index, 'Cantidad': ranking_collages.values}) 

# agrega el número de índice (para que empiece desde 1 y no desde 0)
df_ranking_collages.index = df_ranking_collages.index + 1 

# crea un encabezado y muestra el dataframe
st.subheader("\nRanking de las 5 imágenes más usadas para collages:")
st.dataframe(df_ranking_collages)


# filtra las filas correspondientes a los memes
filas_memes = data[data['operation'] == 'Nuevo meme'] 
# obtiene las imágenes usadas de plantillas en los memes
textos_memes = filas_memes['values'].str.split(';').explode().str.strip() 
# obtiene el ranking de las 5 imágenes más usadas para memes
ranking_memes = textos_memes.value_counts().head(5) 
# lo convierte en un DataFrame
df_ranking_memes = pd.DataFrame({'Imagen': ranking_memes.index, 'Cantidad': ranking_memes.values}) 

# agrega el número de índice (para que empiece desde 1 y no desde 0)
df_ranking_memes.index = df_ranking_memes.index + 1 

# crea un encabezado y muestra el dataframe en streamlit
st.subheader("Ranking de las 5 imágenes más usadas para memes:")
st.dataframe(df_ranking_memes)