"""
Ventana de ayuda, con explicación de qué consiste este proyecto.
Además cuenta con un link hacia la plataforma LinkTree en donde se encuentran listados links a nuestro perfiles de GitHub.
"""

import PySimpleGUI as sg
import webbrowser


def open_help_window(): 

    help_layout = [
        [sg.Text('Esta aplicación permite el tagueo de imágenes, la generación de memes y de collagues.', size=(30, None))],
        [sg.Text('Ante cualquier duda, ingrese al siguiente enlace para comunicarse con cualquiera de sus desarrolladores:', size=(30, None))],
        [sg.Text('LinkTree', enable_events=True, key='-LINK-', size=(30, None), justification='center', text_color='lime')],
        [sg.Button('Volver', key='-VOLVER-')]
    ]

    help_window = sg.Window('Ayuda', help_layout, finalize=True)

    while True:
        event, values = help_window.read()
        if event in (sg.WIN_CLOSED, '-VOLVER-'):
            #print(event)
            break
        if event == '-LINK-':  # Si el elemento de texto es clicado, abre Google
            webbrowser.open('https://linktr.ee/tppython2023')

    help_window.close()

