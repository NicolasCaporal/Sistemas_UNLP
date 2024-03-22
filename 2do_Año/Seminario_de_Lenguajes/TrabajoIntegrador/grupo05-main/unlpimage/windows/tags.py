import PySimpleGUI as sg
import os.path, io
from PIL import Image,ImageTk
import threading
from unlpimage import read_data
from pathlib import Path

#--------------------------------------------------------------------

def tagImagenes(profile_nick):
    enc, config = read_data.read_config()
    

    if (not config):
        sg.popup("No tiene seleccionado un repositorio de imagénes con las que va a trabajar, por favor seleccione una carpeta en el apartado de configuración.",title="AVISO") # Aviso de que no se selecciono una carpeta de imagenes
    else:
        if (config[0][0] == ''):
            sg.popup("No tiene seleccionado un repositorio de imagénes con las que va a trabajar, por favor seleccione una carpeta en el apartado de configuración.",title="AVISO") # Aviso de que no se selecciono una carpeta de imagenes
        else:
            pathFolder = config[0][0]
            path = Path(pathFolder)
            pathFolder = str(path)

            """Recibe un string profile_nick.
            Ejecuta la ventana Etiquetar Imagenes"""

            #------------------------------Iconos de los archivos y carpetas en el tree--------------------------------------------------------------
            folder_icon = b'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsSAAALEgHS3X78AAABnUlEQVQ4y8WSv2rUQRSFv7vZgJFFsQg2EkWb4AvEJ8hqKVilSmFn3iNvIAp21oIW9haihBRKiqwElMVsIJjNrprsOr/5dyzml3UhEQIWHhjmcpn7zblw4B9lJ8Xag9mlmQb3AJzX3tOX8Tngzg349q7t5xcfzpKGhOFHnjx+9qLTzW8wsmFTL2Gzk7Y2O/k9kCbtwUZbV+Zvo8Md3PALrjoiqsKSR9ljpAJpwOsNtlfXfRvoNU8Arr/NsVo0ry5z4dZN5hoGqEzYDChBOoKwS/vSq0XW3y5NAI/uN1cvLqzQur4MCpBGEEd1PQDfQ74HYR+LfeQOAOYAmgAmbly+dgfid5CHPIKqC74L8RDyGPIYy7+QQjFWa7ICsQ8SpB/IfcJSDVMAJUwJkYDMNOEPIBxA/gnuMyYPijXAI3lMse7FGnIKsIuqrxgRSeXOoYZUCI8pIKW/OHA7kD2YYcpAKgM5ABXk4qSsdJaDOMCsgTIYAlL5TQFTyUIZDmev0N/bnwqnylEBQS45UKnHx/lUlFvA3fo+jwR8ALb47/oNma38cuqiJ9AAAAAASUVORK5CYII='
            file_icon = b'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsSAAALEgHS3X78AAABU0lEQVQ4y52TzStEURiHn/ecc6XG54JSdlMkNhYWsiILS0lsJaUsLW2Mv8CfIDtr2VtbY4GUEvmIZnKbZsY977Uwt2HcyW1+dTZvt6fn9557BGB+aaNQKBR2ifkbgWR+cX13ubO1svz++niVTA1ArDHDg91UahHFsMxbKWycYsjze4muTsP64vT43v7hSf/A0FgdjQPQWAmco68nB+T+SFSqNUQgcIbN1bn8Z3RwvL22MAvcu8TACFgrpMVZ4aUYcn77BMDkxGgemAGOHIBXxRjBWZMKoCPA2h6qEUSRR2MF6GxUUMUaIUgBCNTnAcm3H2G5YQfgvccYIXAtDH7FoKq/AaqKlbrBj2trFVXfBPAea4SOIIsBeN9kkCwxsNkAqRWy7+B7Z00G3xVc2wZeMSI4S7sVYkSk5Z/4PyBWROqvox3A28PN2cjUwinQC9QyckKALxj4kv2auK0xAAAAAElFTkSuQmCC'
            #------------------------------------------------------------------------------------------
            treedata = sg.TreeData()
            tags= []
            
            def load_image(filename):
                image = Image.open(filename)
                image.thumbnail((400, 400)) # reducir el tamaño de la imagen
                window["-TEXTO-"].update("Tipo: "+image.format)#----actualizamos el textbox con el tipo de imagen que se selecciono
                    
                return ImageTk.PhotoImage(image)

            def update_image(window, filename):
                image = load_image(filename)
                window['-IMAGE-'].update(data=image) # --------actualiza la imagen en la ventana----------

            def thread_load_image(window, filename):
                """ Recibe la ventana y un str con la ruta de la imagen
                Muestra la imagen en pantalla y los metadatos de la misma (tamaño, resolucion, tipo)"""

                threading.Thread(target=update_image, args=(window, filename)).start()

            def add_files_in_folder(parent, dirname):
                """ Agrega los archivos al tree"""

                files = os.listdir(dirname)
                for f in files:
                    fullname = os.path.join(dirname, f)
                    if os.path.isdir(fullname):            # if it's a folder, add folder and recurse
                        treedata.Insert(parent, fullname, f, values=[], icon=folder_icon)
                        add_files_in_folder(fullname, fullname)
                    else:
                        treedata.Insert(parent, fullname, f, values=[os.stat(fullname).st_size], icon=file_icon)


            def loadDictionary(filename, tags, description, perfil): 
                """Recibe str con ruta de la imagen, una lista de tags (str), una descripcion (str) y en nick_name del perfil (str)
                Retorna un diccionario con: ruta de la imagen, descripcion, resolucion, tamaño, tipo, lista de tags, ultimo perfil que la actualizó"""

                size=os.path.getsize(filename)/1000000
                imagen=Image.open(filename)
                resolution =str(imagen.size[0])+"x"+str(imagen.size[1])

                fileType=imagen.format
                

                dirStr=os.path.join(filename)
                dic = {}
                dic['ruta'] = dirStr
                dic['descripcion'] = description
                dic['resolucion'] = resolution
                dic['tamaño'] = size
                dic['tipo'] = fileType
                dic['tags'] = tags 
                dic['ultimoPerfil'] = perfil

                return dic

            def saveAllCsv(dirImagen, tags, descripcion, profile_nick):
                """ Recibe str con ruta de la imagen, una lista de tags (str), una descripcion (str) y en profile_nick del perfil (str)
                Guarda todos los datos en el csv"""

                dataTag = loadDictionary(dirImagen, tags, descripcion, profile_nick)
                read_data.updateTagsCsv(dataTag)


            
            add_files_in_folder("",pathFolder)
        # --------------Layout----------------------------------------------
            column1 = sg.Column ([
                                [sg.Text("Descripcion")],[sg.InputText(key="-INPUT-DESC-",size=(40, 1))],
                                [sg.Button("Agregar descripcion",key="-DESC-BUTTON-")],
                                [sg.Text("Escribir Tags")], [sg.InputText(key="-INPUT-",size=(40, 1))],
                                [sg.Button("Agregar Tag",key="-TAG-ADD-", size=(11,1)),sg.Button("Eliminar Tag", key="-TAG-DELETE-", size=(11,1))],
                                [sg.Listbox(values='',size=(10,4),key="-INPUT-TAGS-")],       
                                [sg.Tree(data=treedata,
                                headings=['Size', ],
                                auto_size_columns=False,
                                select_mode=sg.TABLE_SELECT_MODE_EXTENDED,
                                num_rows=10,
                                col0_width=20,
                                key='-TREE-',
                                show_expanded=False,
                                enable_events=True,
                                expand_x=True,
                                expand_y=True)],
                            ]) 
                        
        
            column2=sg.Column( [ [sg.Text("",key="-TITULO-")],[sg.Image(key="-IMAGE-",size=(500,500))],
                            [sg.Text("", key="-TEXTO-" ),sg.Text("",key="-SIZE-"),sg.Text("",key="-RESOLUTION-")],
                            [sg.Text("",key="-DESCRIPCION-")]] , vertical_alignment='t' )

            main_column = sg.Column([[column1,column2], [sg.Button("Mostrar imagen", key="-MOSTRAR-"), sg.Push(), sg.Button("Volver",key="-BACK-")]], key = '-MAIN-COLUMN-', scrollable=True, vertical_scroll_only=True, size=(1020, 670))
            layout=[[sg.Text(' '), main_column, sg.Text(' ')]]
        #--------------------------------------------------------------------------------------                                 

            # Crear la ventana
            window = sg.Window("Etiquetar imagenes", layout, finalize=True, resizable=True)
            window.set_min_size((1100, 540))

            # Loop principal de la aplicación
            dirImagen = None  # Variable para guardar la ruta de la imagen seleccionada
            #PARA CUANDO APRETAMOS MOSTRAR
            def updateTags(tags,window):
                """Recibe lista de tags y la ventana
                Actualiza la lista de tags en pantalla (ListBox key=-INPUT-TAGS-"""

                #se agregan los tags al diccionario que tiene como clave la ruta de la imagen        
                window['-INPUT-TAGS-'].update([tag for tag in tags])# actualizamos la lista de tags para cuando se agrega o elimina uno

            window['-MAIN-COLUMN-'].vsb.pack_forget() #Hace invisible la barra de scroll

            while True:
                event, values = window.read()

                # Salir del loop si se cierra la ventana
                if event == sg.WINDOW_CLOSED:
                    break

                # Mostrar imagen seleccionada
                if event == "-MOSTRAR-":  
                    if not values["-TREE-"]:
                        sg.popup("Seleccione una imagen primero")
                        continue
                    dirImagen = values["-TREE-"][0] # se guarda en dirImagen la direccion de la imagen que tenemos seleccionada en el tree
                    
                    #path = Path(dirImagen)
                    #dirImagen = str(path)
                    dirImagen = dirImagen.replace('\\', '/')

                    nombre_imagen=dirImagen.split("\\")
                    window["-DESCRIPCION-"].update("Descripcion:")
                    window["-TITULO-"].update(nombre_imagen[-1])
                    thread_load_image(window, dirImagen)  # mostramos la imagen
                    descripcion=""
                    tags, descripcion, resolution, size = read_data.retDataImageTags(dirImagen)
                    if("" in tags):
                        tags= []
                    if size == "":
                        size=os.path.getsize(dirImagen)/1000000
                        imagen=Image.open(dirImagen)
                        resolution =str(imagen.size[0])+"x"+str(imagen.size[1])
                
                    window["-SIZE-"].update(str(round(float(size),3))+" MB")
                    window["-RESOLUTION-"].update("Resolucion: "+resolution)
                    window["-DESCRIPCION-"].update("Descripcion:\n"+descripcion)
                    window['-INPUT-TAGS-'].update([tag for tag in tags]) # se actualiza con los tags que tenga asociada esa imagen
                # Guardar tag de imagen seleccionada
                if event == "-TAG-ADD-":
                    if dirImagen is None:
                        sg.popup("Seleccione una imagen primero")
                        continue
                    cadena=values["-INPUT-"]
                    #print(f'1: {cadena}')
                    cadena = cadena.strip()
                    #print(f'2: {cadena}')
                    if("" == cadena):
                        sg.popup("Los tags tienen que tener al menos una letra")
                        continue
                    if(" " in cadena):
                        sg.popup("Los tags son de una palabra")   
                        continue   
                    read_data.loadCsvLog(profile_nick,dirImagen)
                    tags.append(cadena)
                    #print(tags)
                    
                    dirImagen = dirImagen.replace('\\', '/')

                    updateTags(tags,window)# agrega los tags
                    saveAllCsv(dirImagen, tags, descripcion, profile_nick)
                    window["-INPUT-"].update("")
                if event == "-TAG-DELETE-":
                    if not values["-TREE-"]:
                        sg.popup("Seleccione una imagen primero")
                        continue
                    if(not values["-INPUT-TAGS-"]):
                        continue
                    read_data.loadCsvLog(profile_nick,dirImagen)
                    tag_nom=values["-INPUT-TAGS-"][0] # seleccionamos un tag
                    tags.remove(tag_nom) # eliminamos del diccionario con la clave de la imagen actual el tag que habiamos seleccionado

                    dirImagen = dirImagen.replace('\\', '/')

                    updateTags(tags,window)# actualizamos los tags
                    saveAllCsv(dirImagen, tags, descripcion, profile_nick)
                if event == "-DESC-BUTTON-":
                    #descripcion=""
                    descripcion=values["-INPUT-DESC-"]
                    window["-DESCRIPCION-"].update("Descripcion:\n"+descripcion)               
                    window["-INPUT-DESC-"].update("")

                    dirImagen = dirImagen.replace('\\', '/')
                    
                    read_data.loadCsvLog(profile_nick,dirImagen)
                    saveAllCsv(dirImagen, tags, descripcion, profile_nick)
                if event == "-BACK-":
                    break
            # Cerrar la ventana al salir del loop
            window.close()

