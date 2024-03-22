"""
Ventana de añadir perfil.
Deberá completar todos los datos.
Deberá introducir un nick que no haya sido ingresado anteriormente.
Además deberá ingresar un nombre válido (sin números enteros), y una edad válida (sin strings, y entre 0 y 100).
"""

from unlpimage.windows import principal
from unlpimage.paths import DEFAULT_IMAGE
from unlpimage import read_data as rd
import PySimpleGUI as sg
from PIL import Image, ImageTk
import os, io, re

def create_profile_windows(profiles_list):
    sg.theme('dark grey 15')
    column1 = [
        [sg.Text('Nick o alias')], 
        [sg.InputText(key="-PROFILE-NICK-", size=(30, 1))],
        [sg.Text('Nombre')], 
        [sg.InputText(key="-PROFILE-NAME-", size=(30, 1))],
        [sg.Text('Edad')],
        [sg.InputText(key="-PROFILE-AGE-", size=(30, 1))],
        [sg.Text('Genero Autopercibido')],
        [sg.Combo(['Masculino', 'Femenino', 'No Binario'], key="-PROFILE-GENDER-", readonly=True)],
    ]

    column2 = [
         [sg.Image(DEFAULT_IMAGE, key="-PROFILE-IMAGE-", size=(300, 300), subsample=(3), pad=((125, 125), (0, 0)))],
         [sg.FileBrowse('Seleccionar Avatar', key="file", enable_events=True, change_submits=True)],
    ]
    
    profile_layout = [
        [sg.Text('Nuevo Perfil', font=("Helvetica", 25)), sg.Push(), sg.Quit('Volver', key="-PROFILE-VOLVER-")],
        [sg.Column(column1), sg.Column(column2, element_justification="center")],
        [sg.Push(), sg.Push(), sg.Submit('Guardar', key="-PROFILE-SAVE-")],
    ]

    profile_window = sg.Window('Perfil', profile_layout)

    while True:
        event, values = profile_window.read()

        if event == sg.WIN_CLOSED or event == "-PROFILE-VOLVER-":
            break

        if event == "file": # actualizo la imagen de perfil cada vez que se selecciona un archivo
            imagefile = values["file"] # obtengo la ruta de la imagen
            profile_window["-PROFILE-IMAGE-"].update(data=rd.get_image(imagefile, resize=False), size=(300, 300), subsample=3) # actualizo la imagen
        if event == "-PROFILE-SAVE-":
                profile_nick = values["-PROFILE-NICK-"]
                profile = next((p for p in profiles_list['profiles'] if p['nick'] == profile_nick), None)
                if ((values["-PROFILE-NICK-"] == "") or (values["-PROFILE-NAME-"] == "") or
                        (values["-PROFILE-AGE-"] == "") or (values["-PROFILE-GENDER-"] == "")):
                        sg.Popup("Por favor, complete todos los datos",title="AVISO")
                elif (len(values["-PROFILE-NICK-"]) > 10):
                    sg.Popup("Por favor, ingrese un nick de menos de 10 caracteres",title="AVISO")
                elif re.search('[0-9]', values["-PROFILE-NAME-"]):
                    sg.Popup("Ingrese un nombre válido (sin números enteros)",title="AVISO")
                else:
                    try:
                        age = int(values["-PROFILE-AGE-"])
                        if (age < 0) or (age > 100):
                            raise ValueError
                    except ValueError:
                        profile_window.Element("-PROFILE-AGE-").Update(value="")
                        sg.popup("Ingrese un valor válido (número entero entre 0 y 100)")
                    else:
                        if (profile):
                            sg.Popup("Nick ya está en uso, por favor, cambielo",title="AVISO")
                        else:
                            # agrego los datos del nuevo perfil a la lista de perfiles
                            image_path = values['file'] if values['file'] else DEFAULT_IMAGE

                            image_path_abs = os.path.abspath(image_path)
                            base_path = os.getcwd()
                            image_path_rel = os.path.relpath(image_path_abs, base_path)
                            image_path_rel = image_path_rel.replace('\\', '/')
                            
                            #breakpoint()

                            new_profile = {
                                "nick": values["-PROFILE-NICK-"],
                                "name": values["-PROFILE-NAME-"],
                                "age": int(values["-PROFILE-AGE-"]),
                                "gender": values["-PROFILE-GENDER-"],
                                "image_path": image_path_rel
                            }

                            profiles_list['profiles'].append(new_profile)  # aquí se agrega el nuevo perfil a la lista de perfiles del diccionario
                            rd.set_profile(profiles_list)

                            #GUARDAR EN LOG
                            rd.add_logs([new_profile['nick'], "Creación de perfil",'',''])
                            break

    profile_window.close()
    principal.create_main_windows()

