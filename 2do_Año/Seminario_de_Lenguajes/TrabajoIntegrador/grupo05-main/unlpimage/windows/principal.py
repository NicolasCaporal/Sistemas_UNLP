"""
Ventana principal donde se ecnuentran todos los perfiles.
Al tocar en cualquiera de ellos nos llevará a la ventana MainMenu donde veremos las distintas acciones que podremos realizar dentro
de nuestro programa.
"""

from unlpimage import read_data
from unlpimage.windows import profiles, main_menu
import PySimpleGUI as sg


def update_profile_frame(profiles_list):
    profile_buttons = [
    [sg.Button(profile['nick'], key=f"-PROFILE-{profile['nick']}-", size=(15, 1)) for profile in profiles_list['profiles'][i:i+4]]
    for i in range(0, len(profiles_list['profiles']), 4)
    ]


    profile_frame = sg.Frame('Selecciona un perfil:', [
        [sg.Column(profile_buttons, scrollable=True, vertical_scroll_only=True, size=(795, 500), key='-MAIN-COLUMN-')],
    ])
    return profile_frame


def create_main_windows():
    sg.theme('dark grey 15')
    sg.SetOptions(font=('Helvetica', 16))

    profiles_list = read_data.read_profiles() # guardo los perfiles YA GUARDADOS/ creo la lista vacia en caso de no haber


    layout = [
        [sg.Column([[update_profile_frame(profiles_list)]], justification='center', element_justification='center',
                   vertical_alignment='center', expand_x=True, expand_y=True, key="-PROFILE-LIST-")],

        [sg.Column(
        [
            [sg.Button('Añadir perfil', key="-MAIN-ADD-PROFILE-", font=('Helvetica', 18))],
            [sg.Cancel('Cancelar', key = "-MAIN-CANCEL-", font=('Helvetica', 18))],
        ],
        justification='center', element_justification='center', vertical_alignment='center', expand_x=True, expand_y=True
        )],
    ]
    window = sg.Window("Main", layout, finalize=True, size=(1000, 750), resizable=True, metadata={"profile_actual": None})
    window['-MAIN-COLUMN-'].vsb.pack_forget()
    
    while True:
        event, values = window.Read()

        if event == sg.WIN_CLOSED or event== "-MAIN-CANCEL-":
            break

        elif event == "-MAIN-ADD-PROFILE-":
            window.close()
            profiles.create_profile_windows(profiles_list)

        elif event.startswith("-PROFILE-"):
            sg.Window.Hide(window)
            profile_nick = event.split("-")[2]
            profile = next((p for p in profiles_list['profiles'] if p['nick'] == profile_nick), None)
            profile_image_path = profile['image_path']

            ok = False
            window.close()
            if profile:
                main_menu.profile_main_menu_window(profile, profile_nick, profiles_list, profile_image_path)
            
    window.close()