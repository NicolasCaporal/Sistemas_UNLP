from wordcloud import WordCloud
import pandas as pd
import streamlit as st
import matplotlib.pyplot as plt
import estadisticas_streamlit as ini
import nltk
from nltk.corpus import stopwords

# descarga las preposiciones
nltk.download('stopwords')
# descarga el tokenizador 
nltk.download('punkt')

# crea un set con todas las preposiciones en español
preposiciones = set(stopwords.words('spanish'))


# lee los datos del log
data = ini.get_data()[0]


# filtra los datos para obtener los textos agregados en los collages
collages_textos = data[data['operation'] == 'Nuevo collage']['texts']
# convierte la serie en un string, convirtiendo todo a string
collages_textos = ' '.join(collages_textos.astype(str).values)
# Tokeniza el texto en palabras ya que asi se trabaja mejor el procesamiento de ellas
palabras_collages = nltk.word_tokenize(collages_textos, language='spanish')  
# filtra las palabras quedandome con aquellas que no sean preposiciones
palabras_collages = [palabra for palabra in palabras_collages if palabra.lower() not in preposiciones]

# se concatenan todos los textos en un solo string
textos_collages = ' '.join(palabras_collages) 

# crea la nube de palabras
wordcloud = WordCloud(width=800, height=400, background_color='white').generate(textos_collages) 
# crea un encabezado
st.subheader("Nube de palabras de los textos agregados en los collages:")
# crea una figura 
plt.figure(figsize=(10, 5))
# muestra la imagen de la nube de palabras en la figura
plt.imshow(wordcloud, interpolation='bilinear')
# hace que no se muestren los ejes en la figura
plt.axis('off')
# muestra la figura creada en streamlit
st.pyplot(plt.gcf())



# filtra los datos para obtener los textos agregados en los memes
memes_textos = data[data['operation'] == 'Nuevo meme']['texts']
# convierte el objeto de tipo serie en un string
memes_textos = ' '.join(memes_textos.astype(str).values)
# tokeniza el texto en palabras ya que asi se trabaja mejor el procesamiento de ellas
palabras_memes = nltk.word_tokenize(memes_textos, language='spanish') 
# filtra las palabras quedandome con aquellas que no sean preposiciones
palabras_memes = [palabra for palabra in palabras_memes if palabra.lower() not in preposiciones]
# se concatenan todos los textos en un solo string
textos_memes = ' '.join(palabras_memes) 

# crea la nube de palabras
wordcloud = WordCloud(width=800, height=400, background_color='white').generate(textos_memes) 

# crea un encabezado
st.subheader("Nube de palabras de los textos agregados en los memes:")
# crea una figura 
plt.figure(figsize=(10, 5))
# muestra la imagen de la nube de palabras en la figura
plt.imshow(wordcloud, interpolation='bilinear')
# hace que no se muestren los ejes en la figura
plt.axis('off')
# muestra la figura creada en streamlit
st.pyplot(plt.gcf())