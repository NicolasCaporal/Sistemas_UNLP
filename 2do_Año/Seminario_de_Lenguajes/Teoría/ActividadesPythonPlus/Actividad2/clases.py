class Banda():
    
    generos = set()
        
    def __init__(self, nombre, genero=None):
        self.nombre=nombre
        self._genero=genero
        self.integrantes=[]
        Banda.generos.add(genero)
          
    @property
    def genero(self):
         return self._genero
    
    @genero.setter
    def genero(self, value):
        self._genero = value

    def __str__(self):
        texto = f"La banda de {self.genero} {self.nombre} está integrada por: "
        for elem in self.integrantes:
            texto += f"\n\t\t{elem}"
        return texto
