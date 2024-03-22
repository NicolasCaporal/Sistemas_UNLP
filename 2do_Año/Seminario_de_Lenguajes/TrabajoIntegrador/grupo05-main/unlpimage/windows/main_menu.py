"""
Ventana en la que aparecen todas las opciones principales de la aplicación.
Se puede configurar las los siguientes directorios:
- repositorio desde donde se tomarán imágenes para taguear y/o hacer collage (solo sie stpan tagueadas)
- carpeta en donde se guardarán los memes creados
- carpeta en donde se guardarán los collages creados
"""

from unlpimage.paths import DEFAULT_IMAGE, SETTINGS_IMAGE, HELP_IMAGE
from unlpimage.windows import collages, config, help,tags, edit_profile, memes, principal
from unlpimage import read_data as rd
import PySimpleGUI as sg
from PIL import Image, ImageTk
import io, os
from pathlib import Path


def profile_main_menu_window(profile, profile_nick, profiles_list, rutaimagen):
    
    column1 = sg.Column([
        [sg.Image(rd.get_image(rutaimagen, 200, 200), key='-PROFILE-PICTURE-', size=(100, 100), enable_events=True, subsample=3), sg.Push(), 
         sg.Button(key='-CONFIG-', image_source=SETTINGS_IMAGE, image_size=(35, 35), button_color=(sg.theme_background_color(), sg.theme_background_color()), border_width=0),
         sg.Button(key='-HELP-',image_source=HELP_IMAGE, image_size=(35, 35), button_color=(sg.theme_background_color(), sg.theme_background_color()), border_width=0)]],
         justification='center', element_justification='center', vertical_alignment='center', expand_x=True, expand_y=True)


    column2 = sg.Column([
        [sg.Button('Etiquetar imagenes', key='-OPEN-TAG-IMAGE-', size=(30, 1))],
        [sg.Button('Generar meme', key='-GENERATE-MEME-', size=(30, 1))],
        [sg.Button('Generar collage',key='-GENERATE-COLLAGE-', size=(30, 1))],
        [sg.Button('Salir', key='-EXIT-BUTTON-', size=(20, 1))]], justification='center', element_justification='center',
                   vertical_alignment='center', expand_x=True, expand_y=True)
    
    main_layout = [
        [column1],
        [column2]
    ]

    main_window = sg.Window('Ventana principal', main_layout, finalize=True, size=(800, 350))
    while True:
        event, values = main_window.read()
        if event in ('-EXIT-BUTTON-', sg.WIN_CLOSED):
            break
        
        elif event == '-PROFILE-PICTURE-':
            main_window.hide()
            nueva_ruta, profile = edit_profile.profile_edit(profile)
            main_window.un_hide()
            main_window['-PROFILE-PICTURE-'].update(rd.get_image(nueva_ruta, 70, 70))

        elif event == '-CONFIG-':
            main_window.hide()
            config.modify_config(profile_nick)
            main_window.un_hide()

        elif event == '-HELP-':
            main_window.hide()
            help.open_help_window()
            main_window.un_hide()

        elif event == '-OPEN-TAG-IMAGE-':
            main_window.hide()
            tags.tagImagenes(profile_nick)
            main_window.un_hide()
        
        elif event == '-GENERATE-MEME-':
            enc, configur = rd.read_config()
            if (not configur):
                sg.popup("No tiene seleccionado una carpeta donde se van a guardar los memes, por favor seleccione una carpeta en el apartado de configuración.",title="AVISO") # Aviso de que no se selecciono una carpeta de imagenes
            else:
                if (configur[0][2] == ''):
                    sg.popup("No tiene seleccionado una carpeta donde se van a guardar los memes, por favor seleccione una carpeta en el apartado de configuración.",title="AVISO") # Aviso de que no se selecciono una carpeta de imagenes
                else:
                    main_window.hide()
                    memes.create_meme_windows(profile_nick)
                    main_window.un_hide()

        elif event == '-GENERATE-COLLAGE-':
            enc, configur = rd.read_config()
            if (not configur):
                sg.popup("No tiene seleccionado una carpeta donde se van a guardar los collages, por favor seleccione una carpeta en el apartado de configuración.",title="AVISO") # Aviso de que no se selecciono una carpeta de imagenes
            else:
                if (configur[0][1] == ''):
                    sg.popup("No tiene seleccionado una carpeta donde se van a guardar los collages, por favor seleccione una carpeta en el apartado de configuración.",title="AVISO") # Aviso de que no se selecciono una carpeta de imagenes
                elif (configur[0][0] == ''):
                    sg.popup("No tiene seleccionado un repositorio de imagénes con las que va a trabajar, por favor seleccione una carpeta en el apartado de configuración.",title="AVISO") # Aviso de que no se selecciono una carpeta de imagenes
                else:
                    main_window.hide()
                    collages.create_collages_windows(profile_nick)
                    main_window.un_hide()

    main_window.close()
    principal.create_main_windows()
