"""
Ventana de configuración desde la cual seleccionaremos las rutas de las imágenes con las que se va a trabajar.
"""

from unlpimage import read_data
import PySimpleGUI as sg
import os

def modify_config(profile_nick):
    sg.theme('dark grey 15')
    working_directory = os.getcwd()
    
    enc, config = read_data.read_config()

    if (config):
        default_image_path = config[0][0]
        default_collage_path = config[0][1]
        default_meme_path = config[0][2]
    else:
        default_image_path = ''
        default_collage_path = ''
        default_meme_path = ''

    config_layout = [
        [sg.Text('Configuracion:'), sg.Push(), sg.Button('< Volver', key='-VOLVER-')],
        [sg.T('Repositorio')],
        [sg.Push(), sg.InputText(key='-IMAGE-PATH-', default_text=default_image_path), sg.FolderBrowse('Seleccionar carpeta', key='-IMAGE-FOLDER-BROWSE-', initial_folder=working_directory)],
        [sg.T('Directorio de collages')],
        [sg.Push(), sg.InputText(key='-COLLAGE-PATH-', default_text=default_collage_path), sg.FolderBrowse('Seleccionar carpeta', key='-COLLAGE-FOLDER-BROWSE-', initial_folder=working_directory)],
        [sg.T('Directorio de memes')],
        [sg.Push(), sg.InputText(key='-MEMES-PATH-', default_text=default_meme_path), sg.FolderBrowse('Seleccionar carpeta', key='-MEMES-FOLDER-BROWSE-', initial_folder=working_directory)],
        [sg.Push(), sg.Push(), sg.Button('Guardar',key="-SAVE-")],
    ]

    config_window = sg.Window('Configuracion', config_layout)

    while True:
        event, values = config_window.read()

        if event in (sg.WIN_CLOSED, '-VOLVER-'):
            break
        if event=="-SAVE-":
            image_path = values["-IMAGE-PATH-"]
            image_path_abs = os.path.abspath(image_path)
            base_path = os.getcwd()
            image_path_rel = os.path.relpath(image_path_abs, base_path)
            image_path_rel = image_path_rel.replace('\\', '/')

            collage_path = values["-COLLAGE-PATH-"]
            collage_path_abs = os.path.abspath(collage_path)
            collage_path_rel = os.path.relpath(collage_path_abs, base_path)
            collage_path_rel = collage_path_rel.replace('\\', '/')
            
            meme_path = values["-MEMES-PATH-"]
            meme_path_abs = os.path.abspath(meme_path)
            meme_path_rel = os.path.relpath(meme_path_abs, base_path)
            meme_path_rel = meme_path_rel.replace('\\', '/')


            if (image_path_rel == '.'):
                image_path_rel = ''
            if (collage_path_rel == '.'):
                collage_path_rel = ''
            if (meme_path_rel == '.'):
                meme_path_rel = ''
            
            # compruebo que los paths elegidos existan, si no hago popup
            if not (image_path_rel == '' or os.path.exists(image_path_rel)):
                sg.popup('Carpeta elegida para el Repositorio NO existe', title='AVISO')
            elif not (collage_path_rel == '' or os.path.exists(collage_path_rel)):
                sg.popup('Carpeta elegida para guardar los Collages NO existe', title='AVISO')
            elif not (meme_path_rel == '' or os.path.exists(meme_path_rel)):
                sg.popup('Carpeta elegida para guardar los Memes NO existe', title='AVISO')
            else:
                # editar CSV de CONFIG
                read_data.set_config([image_path_rel, collage_path_rel, meme_path_rel])

                #GUARDAR EN LOG
                read_data.add_logs([profile_nick, "Cambio en la configuracion del sistema",'',''])
                break


    config_window.close()
