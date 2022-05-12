Este repositorio es de una pequeña prueba de usar GenStage con elixir para orientacion a eventos. Lo que hace este código:
- Crea un supervisor, que invoca un consumidor y un productor
- El productor obtiene la cantidad libre de RAM mediante el uso del archivo /proc/meminfo
- El consumidor obtiene el evento  del productor

Como GenStage esta pensado para usar back-preassure, el evento no es creado hasta que no haya un consumidor listo para consumirlo