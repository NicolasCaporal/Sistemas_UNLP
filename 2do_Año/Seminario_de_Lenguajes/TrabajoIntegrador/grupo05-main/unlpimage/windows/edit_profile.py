"""
Ventana de editar perfil.
Deberá completar todos los datos.
Además deberá ingresar un nombre válido (sin números enteros), y una edad válida (sin strings, y entre 0 y 100).
"""

from unlpimage.paths import DEFAULT_IMAGE, SETTINGS_IMAGE, HELP_IMAGE, JSON_FILE
from unlpimage import read_data
from unlpimage.read_data import get_image
import PySimpleGUI as sg
from PIL import Image, ImageTk
import json, io, os, re
from pathlib import Path

def profile_edit(profile):
    column1 = [
        [sg.Text('Editar Nombre')], 
        [sg.InputText(key="-EDIT-NAME-", default_text=profile['name'], size=(30, 1))],
        [sg.Text('Editar Edad')],
        [sg.InputText(key="-EDIT-AGE-", default_text=profile['age'], size=(30, 1))],
        [sg.Text('Editar Genero Autopercibido')],
        [sg.Combo(['Masculino', 'Femenino', 'No Binario'], key="-EDIT-GENDER-", readonly=True, default_value=profile['gender'])],
    ]

    column2 = [
         [sg.Image(get_image(profile['image_path'], resize=False), key="-EDIT-IMAGE-", size=(300, 300), subsample=(3), pad=((125, 125), (0, 0)))],
         [sg.FileBrowse('Seleccionar Avatar', key="-FILE-", enable_events=True, change_submits=True)],
    ]
    
    edit_layout = [
        [sg.Text('Editar Perfil', font=("Helvetica", 25)), sg.Push(), sg.Quit('Volver', key="-EDIT-VOLVER-")],
        [sg.Column(column1), sg.Column(column2, element_justification="center")],
        [sg.Push(), sg.Push(), sg.Submit('Guardar cambios', key="-EDIT-SAVE-")],
    ]


    edit_window = sg.Window('Editar perfil', edit_layout, finalize=True)
    while True:
        event, values = edit_window.read()
        if event in ('-EDIT-VOLVER-', sg.WIN_CLOSED):
            send_image_path = profile['image_path']
            profile_send = profile
            break
            
        elif event == "-FILE-":
            imagefile = values["-FILE-"] 
            edit_window["-EDIT-IMAGE-"].update(data=get_image(imagefile, resize=False), size=(300, 300), subsample=3) # actualizo la imagen
            
        elif event == "-EDIT-SAVE-":
            if ((values["-EDIT-NAME-"] == "") or (values["-EDIT-AGE-"] == "") or (values["-EDIT-GENDER-"] == "")):
                sg.Popup("Por favor, complete todos los datos",title="AVISO")
            elif re.search('[0-9]', values["-EDIT-NAME-"]):
                sg.Popup("Ingrese un nombre válido (sin números enteros)",title="AVISO")
            else:
                try:
                    age = int(values["-EDIT-AGE-"])
                    if (age < 0) or (age > 100):
                        raise ValueError
                except ValueError:
                    edit_window.Element("-EDIT-AGE-").Update(value="")
                    sg.popup("Ingrese un valor válido (número entero entre 0 y 100)")
                else:
                    nick = profile['nick']
                    
                    if (values["-FILE-"]):
                        image_path = values["-FILE-"]
                        image_path_abs = os.path.abspath(image_path)
                        base_path = os.getcwd()
                        image_path_rel = os.path.relpath(image_path_abs, base_path)
                        image_path_rel = image_path_rel.replace('\\', '/')
                    else:
                        image_path_rel = profile['image_path']

                    new_profile_data = {
                                        "nick": nick,
                                        "name": values["-EDIT-NAME-"],
                                        "age": int(values["-EDIT-AGE-"]),
                                        "gender": values["-EDIT-GENDER-"],
                                        "image_path": image_path_rel
                                    }

                    profiles_list = read_data.read_profiles()
                    for profile_for in profiles_list["profiles"]:
                        if profile_for["nick"] == nick:
                            profile_for["name"] = new_profile_data["name"]
                            profile_for["age"] = new_profile_data["age"]
                            profile_for["gender"] = new_profile_data["gender"]
                            if (new_profile_data["image_path"]):
                                profile_for["image_path"] = new_profile_data["image_path"]
                            break     
                    with open(JSON_FILE, "w") as f:
                        json.dump(profiles_list, f)

                    profile_send = next((p for p in profiles_list['profiles'] if p['nick'] == nick), None)
                    send_image_path = profile_send['image_path']

                    #GUARDAR EN LOG
                    read_data.add_logs([profile['nick'], "Modificación de perfil",'',''])

                    break


    edit_window.close()

    return send_image_path, profile_send
