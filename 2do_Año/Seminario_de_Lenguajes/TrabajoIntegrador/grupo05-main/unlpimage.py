"""
Programa a ejecutar, abre la ventana principal donde se mostrarán todos los perfiles.
"""

from unlpimage.paths import PATH_ICON
from unlpimage.windows import principal
import PySimpleGUI as sg

sg.set_global_icon(PATH_ICON) # aplico el icono a la ventana

if __name__ == "__main__":
    principal.create_main_windows()

