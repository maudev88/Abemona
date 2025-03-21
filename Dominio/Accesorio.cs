using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Accesorio
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public int IdCategoria { get; set; }

        public int IdMaterial { get; set; }

        public float Precio { get; set; }

        public string Imagen { get; set; }

        public string Codigo { get; set; }

        public Elemento Categoria { get; set; }

        public Elemento Material { get; set; }

        public string Descripcion { get; set; }
    }
}
