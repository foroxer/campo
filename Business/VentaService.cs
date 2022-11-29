using DataAccess;
using Models.venta;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public  class VentaService
    {
        private VentaRepository ventaRepository = new VentaRepository();
        public Venta get(int id)
        {
            return new Venta();
        }

        public List<Venta> getAll()
        {
            return new List<Venta>();
        }

        public void createVenta()
        {

        }

        private void saveVenta()
        {

        }

        public List<String> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<Venta> list = ventaRepository.getAll();

            list.ForEach(item =>
            {
                if ( !item.dvh.Equals(ventaRepository.calculateDVH(item)) )
                {
                    errors.Add($"En la tabla Venta: El Venta con id : {item.id} , fue modificado");
                }
            });

            if ( !ventaRepository.calculateDVV(list).Equals(ventaRepository.getDVV()) )
            {
                errors.Add($"El digito verificador vertical de la tabla Venta no es correcto");
            }

            return errors;
        }

        public void reacalcDV()
        {
            ventaRepository.UpdateAllDV();
        }
    }
}
