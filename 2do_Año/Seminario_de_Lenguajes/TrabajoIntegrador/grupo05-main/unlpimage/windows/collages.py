"""
Ventana que dependiendo la plantilla de collage elegida llama a la ventana collagegen,
que permitirá crear un collage a partir de las imágenes (que estén tagueadas) elegidas.
"""

import PySimpleGUI as sg
from unlpimage.paths import DISENIO1, DISENIO2, DISENIO3, DISENIO4, DISENIO5
from unlpimage.read_data import get_image
from unlpimage.windows import collagegen

def create_collages_windows(profile_nick):
    layout = [

        [sg.Column(
        [
            [sg.Text('Seleccionar diseño de collage', key="-TEXT-"), sg.Push(), sg.Quit('< Volver', key='-COLLAGE-VOLVER-')],
            [sg.Image(get_image(DISENIO1), key='-DISENIO1-', enable_events=True, size=(150, 150), subsample=(3)), sg.Image(get_image(DISENIO2), key='-DISENIO2-', enable_events=True, size=(150, 150), subsample=(3), pad=(25, 25)), sg.Image(get_image(DISENIO3), key='-DISENIO3-', enable_events=True, size=(150, 150), subsample=(3))],
            [sg.Image(get_image(DISENIO4), key='-DISENIO4-', enable_events=True, size=(150, 150), subsample=(3)), sg.Image(get_image(DISENIO5), key='-DISENIO5-', enable_events=True, size=(150, 150), subsample=(3), pad=(25, 0))],
        ],
        justification='center', element_justification='center', vertical_alignment='center', expand_x=True, expand_y=True
        )],
    ]
    collage_window = sg.Window("Collages", layout, finalize=True, size=(650, 420), resizable=True)
    while True:
        event, values = collage_window.Read()
        if event == sg.WIN_CLOSED or event== "-COLLAGE-VOLVER-":
            break
        if event.startswith("-DISENIO"):
            collage_window.hide()
            match event:
                case "-DISENIO1-":
                    collagegen.create_collages_windows(DISENIO1, 1, 2, profile_nick)
                case "-DISENIO2-":
                    collagegen.create_collages_windows(DISENIO2, 2, 2, profile_nick)
                case "-DISENIO3-":
                    collagegen.create_collages_windows(DISENIO3, 3, 4, profile_nick)
                case "-DISENIO4-":
                    collagegen.create_collages_windows(DISENIO4, 4, 3, profile_nick)
                case "-DISENIO5-":
                    collagegen.create_collages_windows(DISENIO5, 5, 3, profile_nick)
            collage_window.un_hide()
    
    collage_window.close()