# 🕹️ Videojuego Multiplataforma 2D | 2D Cross-Platform Game  

[![Godot 3.5](https://img.shields.io/badge/Godot-3.5-%23478cbf)](https://godotengine.org/)  
[![Licencia](https://img.shields.io/badge/Licencia-MIT-green)](https://opensource.org/licenses/MIT)  
[![Estado](https://img.shields.io/badge/Estado-Completado-%2306d6a0)](https://github.com/je7remy/videoJuegoMultiplataforma2d)  

![Captura de Juego](https://je7remy.github.io/web-personal/images/juego.jpg)  

Proyecto desarrollado en **Godot Engine 3.5** con GDScript, demostrando capacidades de desarrollo multiplataforma y buenas prácticas de programación. Un viaje de aprendizaje que combinó lógica de programación, optimización de sistemas y diseño gráfico, mientras descubría la importancia fundamental de la ciberseguridad en el desarrollo de software.  

Project developed in **Godot Engine 3.5** with GDScript, demonstrating cross-platform development capabilities and programming best practices. A learning journey that combined programming logic, system optimization, and graphic design, while discovering the fundamental importance of cybersecurity in software development.  

## 🚀 Características Destacadas | Key Features  
- **Multiplataforma Nativo**: Ejecutable en Windows, Linux y macOS  
- **Arquitectura Modular**: Sistemas independientes fácilmente escalables  
- **Optimización de Recursos**: Gestión eficiente de memoria y assets  
- **Diseño Interactivo**: Mecánicas de juego fluidas y responsivas  
- **Sistema de Seguridad**: Prácticas básicas de protección de datos  

## 🧠 Aprendizajes Clave | Key Learnings  
- 🔄 **Lógica de Programación**: Estructuras de datos complejas y patrones de diseño  
- 🖥️ **Optimización**: Reducción de carga de CPU/GPU en dispositivos limitados  
- 🎨 **Diseño Gráfico**: Creación de assets y animaciones 2D coherentes  
- 🔒 **Ciberseguridad**: Implementación de prácticas seguras en comunicación cliente-servidor  
- 🧪 **Testing**: Pruebas iterativas en diferentes hardware y SO  

## 📥 Instalación | Installation  
1. Descargar [Godot Engine 3.5](https://godotengine.org/download)  
2. Clonar repositorio:  

    ```bash  
    git clone https://github.com/je7remy/videoJuegoMultiplataforma2d.git  
    ```  

3. Abrir proyecto en Godot Engine  
4. Ejecutar `main.tscn` desde el editor  

**Exportar ejecutable:**  
`Proyecto → Exportar → Seleccionar plataforma destino`  

## 🛠️ Estructura del Proyecto | Project Structure  
```  
.  
├── assets/               # Recursos gráficos y sonido  
│   ├── sprites/          # Spritesheets y tilesets  
│   └── sounds/           # Efectos y música  
├── scripts/              # Lógica en GDScript  
│   ├── entities/         # Jugador, NPCs, enemigos  
│   ├── systems/          # Gestión de juego y UI  
│   └── utilities/        # Herramientas y helpers  
├── scenes/               # Escenas principales  
└── project.godot         # Configuración de Godot  
```  

## 🔍 Insights Técnicos | Technical Insights  
```gdscript  
# Ejemplo de optimización: Carga diferida de recursos  
func load_scene_async(path: String):  
    var loader = ResourceLoader.load_interactive(path)  
    while true:  
        var err = loader.poll()  
        if err == ERR_FILE_EOF:  
            return loader.get_resource()  
        elif err != OK:  
            return null  
        yield(get_tree(), "idle_frame")  
```  

## 🛡️ Consideraciones de Seguridad | Security Considerations  
- Validación de inputs de usuario  
- Cifrado básico de datos de configuración  
- Sistema anti-trampas en mecánicas clave  
- Protección contra modificaciones no autorizadas  

## 📈 Evolución Profesional | Professional Growth  
Este proyecto marcó un punto crucial en mi desarrollo como programador:  
- De **syntax learner** a **system architect**  
- Primer contacto con conceptos de hardening básico  
- Comprensión del ciclo completo de desarrollo  
- Base fundamental para mi actual interés en DevSecOps  

## 🤝 Contribuciones | Contributions  
Se aceptan mejoras en:  
- Sistema de guardado seguro  
- Optimización de renderizado  
- Implementación de redes seguras  
- Documentación técnica  

## 📜 Licencia | License  
MIT License - Ver [LICENSE](LICENSE) para detalles completos  

---  

*"El verdadero éxito en el desarrollo de juegos está en equilibrar creatividad, rendimiento y seguridad"* - Jérémy 
