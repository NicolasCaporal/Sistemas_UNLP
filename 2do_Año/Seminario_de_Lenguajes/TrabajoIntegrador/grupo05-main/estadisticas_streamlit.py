import pandas as pd
import streamlit as st
import json
import warnings 
from unlpimage.paths import LOG, JSON_FILE

warnings.simplefilter("ignore") # deshabilitamos las advertencias

data = pd.read_csv(LOG)
with open(JSON_FILE, 'r') as file:
    data_json = json.load(file)
data_json = data_json
perfiles = data_json['profiles'] # obtener la lista de perfiles
df_perfiles = pd.DataFrame(perfiles) # creamos el dataframe de los perfiles

def get_data():
    return [data, data_json]

def get_profile_df():
    return df_perfiles

st.set_page_config(
    page_title= "Grupo 05 - Seminario de python",
    page_icon= "📊",
)

st.write("# Bienvenidos al streamlit del grupo 05! 👋")

st.markdown(
    """
    Esta es la aplicacion Streamlit que generamos con la que podran visualizar las estadisticas de los logs del sistema. 
    **👈Seleccione algun grafico del sidebar**
    ### Integrantes:
    - Bautista Bordes 
    - Nicolas Caporal 
    - Esteban Noé Manzano Reynoso 
    - Juan Cruz Tucci
    ### Si quieren mas informacion de sus desarrolladores
    - Contacto [Linktree](https://linktr.ee/tppython2023)
"""
)

