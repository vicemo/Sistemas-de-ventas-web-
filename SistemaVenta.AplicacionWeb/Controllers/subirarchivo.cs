using Microsoft.AspNetCore.Mvc;

namespace SistemaVenta.AplicacionWeb.Controllers
{
    public class subirarchivo : Controller
    {
        [HttpPost]
        public IActionResult SubirArchivo(IFormFile archivo)
        {
            if (archivo != null && archivo.Length > 0)
            {
                // Guarda el archivo en el servidor
                var ruta = Path.Combine("C:/wwwroot/img//", archivo.FileName);
                using (var archivoStream = new FileStream(ruta, FileMode.Create))
                {
                    archivo.CopyTo(archivoStream);
                }
                // Ahora 'ruta' contiene la ubicación del archivo en el servidor
                return RedirectToAction("Negocio"); // O la acción que desees
            }
            return View("Error"); // Maneja el caso donde no se sube un archivo
        }

    }
}
