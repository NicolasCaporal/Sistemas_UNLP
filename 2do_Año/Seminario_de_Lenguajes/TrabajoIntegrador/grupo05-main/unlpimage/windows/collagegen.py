"""
Ventana que permite generar un collage al seleccionar las imágenes solicitadas, agregando un título, ingresado por
el usuario, en la zona inferior izquierda de la nueva imagen generada.
"""

import PySimpleGUI as sg
from unlpimage import read_data as rd
import os
from pathlib import Path

class ImagenInvalidaError(Exception):
    """ Esta excepción se producirá cuando la imagen seleccionada sea inválida (no esté tagueada)"""
    def __init__(self, valor):
        self.data = valor

    def __str__(self):
        return f"{self.data}"

def procesar(values, num_disenio, imagenes_a_solicitar, profile_nick, guardar=False):
    titulo = values['-Titulo-'] # Obtener el título ingresado
    if (len(titulo) > 10):
        raise ValueError("El título ingresado tiene que tener menos de 10 caracteres.")
    try:
        rutas_imagenes = [values[f'-Imagen-{i+1}-'] for i in range(imagenes_a_solicitar)] # Obtener las rutas de las imágenes seleccionadas
        if any(not ruta_imagen for ruta_imagen in rutas_imagenes):
            raise ValueError
        try:
            for i, dirImagen in enumerate(rutas_imagenes):
                dirImagen = rd.get_relative_path(dirImagen)
                #dirImagen = dirImagen.replace('/', '\\')
                if not rd.comprobar_tags(dirImagen):
                    raise ImagenInvalidaError(f"La imagen {i+1} seleccionada es inválida (no está tagueada).")
        except ImagenInvalidaError as e:
                raise ImagenInvalidaError(str(e))
    except ValueError as e:
        raise ValueError(str(e))
    except ImagenInvalidaError as e:
        raise ImagenInvalidaError(str(e))
    else:
        if titulo == '':
            sg.popup("Debe ingresar un título para el collage.", title="AVISO")
        else:
            for i in range(len(rutas_imagenes)):
                rutas_imagenes[i] = rd.get_relative_path(rutas_imagenes[i])
            if (guardar):
                nombres_imagenes = [os.path.basename(ruta_imagen) for ruta_imagen in rutas_imagenes]

                rutas_imagenes_logs = ';'.join([nombres_imagenes[i] for i in range(len(nombres_imagenes))])
                rd.add_logs([profile_nick, "Nuevo collage",rutas_imagenes_logs,titulo])

                rd.create_collage(num_disenio, rutas_imagenes, titulo)
                nueva_imagen = rd.create_collage(num_disenio, rutas_imagenes, titulo)
            else:
                nueva_imagen = rd.create_collage(num_disenio, rutas_imagenes, titulo, guardar=False)
            return nueva_imagen
    

def create_collages_windows(disenio, num_disenio, imagenes_a_solicitar, profile_nick):

    repositorio = rd.get_repository_directory()
    path = Path(repositorio)
    repositorio = str(path)

    imagen_fields = [
    [sg.FileBrowse(f'Seleccionar imagen {i+1}', key=f'-Imagen-{i+1}-', initial_folder=repositorio)]
    for i in range(imagenes_a_solicitar)
    ]

    
    column1 = [
        [sg.Column(imagen_fields)],
        [sg.Text('Título')],
        [sg.InputText(key='-Titulo-', size=(18, 1))],
    ]
    
    column2 = [
        [sg.Image(rd.get_image(disenio, 1500, 700), key="-IMAGE-SHOW-", size=(500, 450), subsample=(2))],
        [sg.Push(), sg.Button('Previsualizar', key="-MOSTRAR-COLLAGE-"), sg.Submit('Guardar',key="-SAVE-")],
    ]

    layout = [
        [sg.Column(
        [
            [sg.Text('Generar collage'), sg.Push(), sg.Button('< Volver', key='-COLLAGE-VOLVER-')],
            [sg.Column(column1), sg.Column(column2)],
        ],
        justification='center', element_justification='center', vertical_alignment='center', expand_x=True, expand_y=True
        )],
    ]
    collagegen_window = sg.Window("Collages", layout, finalize=True, size=(850, 600), resizable=True)
    window_size = collagegen_window.size


    while True:
        event, values = collagegen_window.Read()
        if event == sg.WIN_CLOSED or event== "-COLLAGE-VOLVER-":
            break
        
        if event == "-MOSTRAR-COLLAGE-":
            try:
                nueva_imagen = procesar(values, num_disenio, imagenes_a_solicitar, profile_nick)
                if (nueva_imagen != None):
                    collagegen_window["-IMAGE-SHOW-"].update(data=nueva_imagen, size=(500, 450))
                    collagegen_window.size = window_size
            except ValueError as e:
                sg.popup(str(e), title="AVISO")
            except ImagenInvalidaError as e:
                sg.popup(str(e), title="AVISO")


        if event == '-SAVE-':
            try:
                procesar(values, num_disenio, imagenes_a_solicitar, profile_nick, guardar=True)
            except ValueError as e:
                sg.popup(str(e), title="AVISO")
            except ImagenInvalidaError as e:
                sg.popup(str(e), title="AVISO")
            else:
                sg.popup("Collage creado correctamente.")
                break

    collagegen_window.close()